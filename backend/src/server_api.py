import asyncio
import json  # ¡Nueva importación necesaria!
import socket
import time
from typing import Any

from fastapi import FastAPI
from fastapi.responses import JSONResponse, StreamingResponse  # Añade StreamingResponse
from pydantic import BaseModel

# Importamos el motor core y la excepción de control
import bot_core
from src.helpers import RateLimitReachedException

app = FastAPI(title="Gemini RPA API Gateway")


def check_internet_connection():
    """Verifica si la PC host tiene conexión a internet real."""
    try:
        # Intenta conectar al DNS de Google (puerto 53) con 2 segundos de timeout
        socket.create_connection(("8.8.8.8", 53), timeout=2)
        return True
    except OSError:
        return False


def clean_ai_studio_markdown(raw_text):
    """
    Limpia la basura visual de AI Studio y asegura los cierres de código (```)
    mediante un parser inteligente línea por línea.
    """
    lineas = raw_text.split("\n")
    resultado = []
    in_code_block = False
    skip_lines = 0

    for i, linea in enumerate(lineas):
        # Si estamos saltando las líneas de "basura" de los botones, continuamos
        if skip_lines > 0:
            skip_lines -= 1
            continue

        linea_limpia = linea.strip()

        # 1. DETECTAR INICIO DE BLOQUE (La firma de 5 líneas de AI Studio)
        if linea_limpia == "code" and (i + 4) < len(lineas):
            if (
                lineas[i + 2].strip() == "download"
                and lineas[i + 3].strip() == "content_copy"
                and lineas[i + 4].strip() == "expand_less"
            ):
                lenguaje = lineas[i + 1].strip()
                resultado.append(f"```{lenguaje}")
                in_code_block = True
                skip_lines = 4  # Ignoramos las próximas 4 líneas
                continue

        # 2. DETECTAR FIN DE BLOQUE (Usando tus anclas de prompt)
        # Solo insertamos el cierre si estamos DENTRO de un bloque de código
        if in_code_block and (
            linea_limpia.startswith("PART ") or linea_limpia.startswith("IMPLEMENTATION:")
        ):
            # Insertamos el cierre justo antes de imprimir tu cabecera
            resultado.append("```")
            in_code_block = False

        # Añadimos la línea normal al resultado
        resultado.append(linea)

    # 3. CIERRE DE SEGURIDAD FINAL
    # Si el texto terminó (ej. bloque de Bash) y quedó abierto, lo cerramos.
    if in_code_block:
        resultado.append("```")

    return "\n".join(resultado)


# --- MODELOS DE DATOS (OpenAI Standard Blindado) ---
class ChatRequest(BaseModel):
    messages: list[dict[str, Any]]
    model: str | None = None
    temperature: float | None = None
    stream: bool | None = False

    # Esta configuración evita los errores 422 si OpenCode manda campos extra
    class Config:
        extra = "allow"


# 🚦 SEMÁFORO Y CACHÉ ANTI-REINTENTOS
bot_lock = asyncio.Lock()
last_processed_prompt = ""
last_generated_response = ""
agente_actual = "Desconocido (No se ha inicializado)"


@app.post("/v1/chat/completions")
async def chat_completions(request: ChatRequest):
    global last_processed_prompt, last_generated_response, agente_actual

    # 1. PRE-CHECK DE RED (Antes de hacer cualquier cosa)
    if not check_internet_connection():
        print("❌ [RED] Error: No hay conexión a internet.")
        return JSONResponse(
            status_code=400,  # Cambiado a 400 para detener OpenCode
            content={
                "error": {
                    "message": "🛑 SERVIDOR RPA SIN RED: La PC del bot no tiene conexión a Internet.",
                    "type": "invalid_request_error",
                    "code": "network_error",
                }
            },
        )

    async with bot_lock:
        try:
            # --- EXTRACCIÓN ULTRALIGERA (SOLO EL ÚLTIMO MENSAJE DEL USUARIO) ---
            ultimo_mensaje_texto = ""

            # Recorremos los mensajes, pero SOLO nos interesa el último que sea del 'user'
            for msg in request.messages:
                if msg.get("role") == "user":
                    contenido = msg.get("content")
                    if not contenido:
                        continue

                    texto_extraido = ""
                    if isinstance(contenido, str):
                        texto_extraido = contenido
                    elif isinstance(contenido, list):
                        for item in contenido:
                            if isinstance(item, dict) and item.get("type") == "text":
                                texto_extraido += item.get("text", "") + "\n"

                    if texto_extraido.strip():
                        ultimo_mensaje_texto = texto_extraido.strip()

            if not ultimo_mensaje_texto:
                raise ValueError("No se encontró ningún mensaje de usuario en la petición.")

            # Limpiamos la muletilla automática que añade OpenCode al llamar subagentes
            texto_a_limpiar = "Use the above message and context to generate a prompt and call the task tool with subagent:"
            if texto_a_limpiar in ultimo_mensaje_texto:
                # Cortamos el texto justo antes de la muletilla
                ultimo_mensaje_texto = ultimo_mensaje_texto.split(texto_a_limpiar)[0].strip()

            # Quitamos también la mención al agente (ej. "@skdev" o "@skarch") para que Gemini reciba la pregunta limpia
            if ultimo_mensaje_texto.startswith("@skdev"):
                ultimo_mensaje_texto = ultimo_mensaje_texto.replace("@skdev", "", 1).strip()
            elif ultimo_mensaje_texto.startswith("@skarch"):
                ultimo_mensaje_texto = ultimo_mensaje_texto.replace("@skarch", "", 1).strip()

            # Ahora final_prompt es EXCLUSIVAMENTE tu pregunta limpia
            final_prompt = ultimo_mensaje_texto
            comando_limpio = final_prompt.lower()
            # -------------------------------------------------------

            # --- INTERCEPTOR INTELIGENTE DE COMANDOS ---
            if comando_limpio.startswith("/rpa_change "):
                agent_type = comando_limpio.replace("/rpa_change ", "").strip()
                print(f"🔄 [API] Comando de cambio de pestaña detectado: {agent_type}")

                if agent_type not in ["skdev", "skarch"]:
                    raise ValueError(
                        "Comando incompleto. Usa '/rpa_change skdev' o '/rpa_change skarch'"
                    )

                last_processed_prompt = ""
                last_generated_response = ""
                agente_actual = agent_type  # <-- Guardamos el agente activo

                await asyncio.to_thread(bot_core.switch_tab, agent_type)
                msg = f"🔄 **Cambio exitoso.**\nAhora tu bot está operando en la pestaña de **{agent_type.upper()}**."

            elif comando_limpio.startswith("/rpa_mode ") or comando_limpio.startswith(
                "/rpa_new talk"
            ):
                print(f"🔧 [API] Comando de entorno detectado: {comando_limpio}")
                is_new_chat = comando_limpio.startswith("/rpa_new talk")

                agent_type = None
                if "skdev" in comando_limpio:
                    agent_type = "skdev"
                elif "skarch" in comando_limpio:
                    agent_type = "skarch"

                if comando_limpio.startswith("/rpa_mode ") and not agent_type:
                    raise ValueError(
                        "Comando incompleto. Usa '/rpa_mode skdev' o '/rpa_mode skarch'"
                    )

                last_processed_prompt = ""
                last_generated_response = ""
                if agent_type:
                    agente_actual = agent_type  # <-- Guardamos el agente activo

                await asyncio.to_thread(bot_core.setup_agent_environment, agent_type, is_new_chat)

                if is_new_chat and agent_type:
                    msg = f"✅ **Tablero limpio y Agente configurado.**\nIniciaste nueva conversación con **{agent_type.upper()}**."
                elif is_new_chat:
                    msg = "✅ **Nueva conversación iniciada.**\nSe limpió el contexto, pero se mantiene el agente actual."
                else:
                    msg = f"✅ **Modo inyectado.**\nLa conversación actual usará las reglas de **{agent_type.upper()}**."

            # ---> NUEVA OPCIÓN 1: CONSULTAR ESTADO <---
            elif comando_limpio == "/rpa_status" or comando_limpio == "/rpa_agente":
                msg = f"🤖 **Estado del RPA:**\nEl agente que está activo actualmente es: **{agente_actual.upper()}**"

            # ---> NUEVA OPCIÓN 2: BLOQUEO DE COMANDOS INVÁLIDOS <---
            elif comando_limpio.startswith("/rpa_"):
                comando_erroneo = ultimo_mensaje_texto.strip()
                print(f"⚠️ [API] Comando inválido bloqueado: {comando_erroneo}")
                msg = f"❌ **Comando no reconocido:** `{comando_erroneo}`\n\n📌 **Comandos válidos:**\n* `/rpa_mode [skdev/skarch]`\n* `/rpa_change [skdev/skarch]`\n* `/rpa_new talk [skdev/skarch]`\n* `/rpa_status`"

            # --- ENVÍO DE RESPUESTA PARA CUALQUIER COMANDO ---
            # Si entramos en cualquiera de los 'if' anteriores, 'msg' existe.
            # Devolvemos el mensaje a OpenCode y CORTAMOS la ejecución aquí para no ir a Gemini.
            if comando_limpio.startswith("/rpa_"):
                if request.stream:

                    async def command_stream_generator():
                        chunk = {
                            "id": f"chatcmpl-cmd-{int(time.time())}",
                            "object": "chat.completion.chunk",
                            "created": int(time.time()),
                            "model": request.model or "gemini-rpa",
                            "choices": [
                                {"index": 0, "delta": {"content": msg}, "finish_reason": None}
                            ],
                        }
                        yield f"data: {json.dumps(chunk)}\n\n"
                        end_chunk = {
                            "id": f"chatcmpl-cmd-{int(time.time())}",
                            "object": "chat.completion.chunk",
                            "created": int(time.time()),
                            "model": request.model or "gemini-rpa",
                            "choices": [{"index": 0, "delta": {}, "finish_reason": "stop"}],
                        }
                        yield f"data: {json.dumps(end_chunk)}\n\n"
                        yield "data: [DONE]\n\n"

                    return StreamingResponse(
                        command_stream_generator(), media_type="text/event-stream"
                    )
                else:
                    return {
                        "id": f"chatcmpl-cmd-{int(time.time())}",
                        "object": "chat.completion",
                        "created": int(time.time()),
                        "model": request.model or "gemini-rpa",
                        "choices": [
                            {
                                "index": 0,
                                "message": {"role": "assistant", "content": msg},
                                "finish_reason": "stop",
                            }
                        ],
                        "usage": {"prompt_tokens": 0, "completion_tokens": 0, "total_tokens": 0},
                    }
            # -----------------------------------------------------

            # Si no es un comando especial, continúa con el RPA normal...
            print("\n" + "=" * 50)

            print(
                f"📥 New request received (Model: {request.model or 'default'}, Stream: {request.stream})"
            )

            # 2. REVISAMOS LA CACHÉ
            if final_prompt == last_processed_prompt and last_generated_response != "":
                print("🔄 [CACHÉ] Reintento detectado. Sirviendo respuesta guardada.")
                ai_response = last_generated_response
            else:
                # 3. EL BOT TRABAJA
                print(f"🤖 Prompt processed (Length: {len(final_prompt)} characters).")
                print("🖱️ Handing over control to the RPA engine...")

                ai_response_raw = await asyncio.to_thread(bot_core.execute_rpa_task, final_prompt)
                ai_response = clean_ai_studio_markdown(ai_response_raw)

                last_processed_prompt = final_prompt
                last_generated_response = ai_response

            # 4. RESPUESTA (STREAMING vs NORMAL)
            if request.stream:

                async def stream_generator():
                    chunk = {
                        "id": f"chatcmpl-{int(time.time())}",
                        "object": "chat.completion.chunk",
                        "created": int(time.time()),
                        "model": request.model or "gemini-rpa",
                        "choices": [
                            {"index": 0, "delta": {"content": ai_response}, "finish_reason": None}
                        ],
                    }
                    yield f"data: {json.dumps(chunk)}\n\n"

                    end_chunk = {
                        "id": f"chatcmpl-{int(time.time())}",
                        "object": "chat.completion.chunk",
                        "created": int(time.time()),
                        "model": request.model or "gemini-rpa",
                        "choices": [{"index": 0, "delta": {}, "finish_reason": "stop"}],
                    }
                    yield f"data: {json.dumps(end_chunk)}\n\n"
                    yield "data: [DONE]\n\n"

                return StreamingResponse(stream_generator(), media_type="text/event-stream")

            else:
                return {
                    "id": f"chatcmpl-{int(time.time())}",
                    "object": "chat.completion",
                    "created": int(time.time()),
                    "model": request.model or "gemini-rpa",
                    "choices": [
                        {
                            "index": 0,
                            "message": {"role": "assistant", "content": ai_response},
                            "finish_reason": "stop",
                        }
                    ],
                    "usage": {
                        "prompt_tokens": len(final_prompt) // 4,
                        "completion_tokens": len(ai_response) // 4,
                        "total_tokens": (len(final_prompt) + len(ai_response)) // 4,
                    },
                }

        # --- BLOQUE DE MANEJO DE EXCEPCIONES ---

        except asyncio.CancelledError:
            # OpenCode cerró la conexión
            print("⚠️ [API] Petición cancelada por el cliente (OpenCode se desconectó).")
            raise

        except RateLimitReachedException:
            print("⚠️ [API] Límite de cuota detectado en Google AI Studio.")
            return JSONResponse(
                status_code=400,  # Cambiado a 400
                content={
                    "error": {
                        "message": "⚠️ LÍMITE DE CUOTA: Has alcanzado el límite en AI Studio. Espera un momento.",
                        "type": "invalid_request_error",
                        "code": "rate_limit_error",
                    }
                },
            )

        except ValueError as e:
            print(f"⚠️ [API] Bad Request: {str(e)}")
            return JSONResponse(
                status_code=400,
                content={
                    "error": {
                        "message": str(e),
                        "type": "invalid_request_error",
                        "code": "bad_request",
                    }
                },
            )

        except Exception as e:
            error_msg = str(e)

            # --- Intercepción de página no visible ---
            if "AISTUDIO_NOT_FOUND" in error_msg:
                print("❌ [VISIÓN] Error: El logo de Google AI Studio no se detecta en pantalla.")
                return JSONResponse(
                    status_code=400,  # Cambiado a 400
                    content={
                        "error": {
                            "message": "🛑 SERVIDOR RPA BLOQUEADO: La pestaña de Google AI Studio no está visible en la pantalla. Maximiza la ventana para continuar.",
                            "type": "invalid_request_error",
                            "code": "ui_not_ready_error",
                        }
                    },
                )

            # Error crítico general del RPA
            print(f"❌ [CRITICAL RPA ERROR]: {error_msg}")
            return JSONResponse(
                status_code=400,  # Cambiado a 400
                content={
                    "error": {
                        "message": f"🤖 ERROR DEL BOT RPA: {error_msg}",
                        "type": "invalid_request_error",
                        "code": "rpa_execution_error",
                    }
                },
            )


if __name__ == "__main__":
    import uvicorn

    # Ejecutamos con workers=1 para evitar colisiones de mouse/teclado
    uvicorn.run(app, host="0.0.0.0", port=8000)
