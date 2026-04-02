import subprocess
import time

import pyautogui
import pyperclip
from PIL import ImageChops

# Importamos nuestras configuraciones y utilidades
from src.config import (
    IMG_AISTUDIO_LOGO,
    IMG_COPY_MD,
    IMG_CREATE_INSTR,
    IMG_LIST_INSTR,
    IMG_PRO_MODEL,
    IMG_SKARCH_INSTR,
    IMG_SKDEV_INSTR,
    IMG_SYS_INSTR,
    IMG_TITLE_INSTR,
    IMG_TOOL_FULL,
    IMG_TOOL_MENU,
)
from src.helpers import (
    RateLimitReachedException,
    check_for_rate_limit,
    clean_prompt_text,
    is_spinner_visible,
)


def safe_locate(image_path, conf=0.8):
    """Busca una imagen y devuelve None si no la encuentra, evitando que el bot explote."""
    try:
        return pyautogui.locateOnScreen(image_path, grayscale=True, confidence=conf)
    except Exception:
        return None


def setup_agent_environment(agent_type: str = "", new_chat: bool = False):
    print(f"\n⚙️ [SETUP] Ejecutando comando RPA. Agente: {agent_type}, New Chat: {new_chat}")
    screen_width, screen_height = pyautogui.size()

    # 1. ¿NUEVA CONVERSACIÓN?
    if new_chat:
        print("   [Acción] Iniciando nueva conversación...")
        logo = safe_locate(IMG_AISTUDIO_LOGO, conf=0.8)
        if not logo:
            raise Exception("AISTUDIO_NOT_FOUND")
        pyautogui.click(pyautogui.center(logo))
        # Aumentamos a 4 segundos porque recargar la página en blanco toma su tiempo
        time.sleep(4.0)

    # 2. ASEGURAR MODELO PRO (Se ejecuta SIEMPRE)
    print("   [Acción] Asegurando modelo Pro...")
    pyautogui.click(1600, 300)
    time.sleep(1.0)

    # Quitamos el ratón del medio para no interferir visualmente
    pyautogui.moveTo(10, 10)
    time.sleep(0.5)

    pro_model = safe_locate(IMG_PRO_MODEL, conf=0.8)
    if pro_model:
        pyautogui.click(pyautogui.center(pro_model))
        print("      [MATCH] Modelo Pro seleccionado.")
    else:
        print("      [Aviso] Opción Pro no detectada (Quizás ya estaba activo).")

    # 🔴 CRÍTICO: Clic en el centro para CERRAR el menú desplegable del modelo
    pyautogui.click(screen_width / 2, screen_height / 2)
    time.sleep(1.0)

    # 3. ¿CAMBIO DE INSTRUCCIONES?
    if agent_type:
        agent_type = agent_type.upper()
        print(f"   [Acción] Configurando System Instructions para {agent_type}...")

        # Mover el ratón a la esquina
        pyautogui.moveTo(10, 10)
        time.sleep(0.5)

        sys_inst = safe_locate(IMG_SYS_INSTR, conf=0.8)
        if sys_inst:
            pyautogui.click(pyautogui.center(sys_inst))
        time.sleep(1.0)

        pyautogui.moveTo(10, 10)
        time.sleep(0.5)

        list_inst = safe_locate(IMG_LIST_INSTR, conf=0.8)
        if list_inst:
            pyautogui.click(pyautogui.center(list_inst))
        time.sleep(1.5)

        pyautogui.moveTo(10, 10)
        time.sleep(0.5)

        target_img = IMG_SKDEV_INSTR if agent_type == "SKDEV" else IMG_SKARCH_INSTR
        agent_inst_exists = safe_locate(target_img, conf=0.9)

        if agent_inst_exists:
            print(f"      [MATCH] Instrucción {agent_type} encontrada.")
            pyautogui.click(pyautogui.center(agent_inst_exists))
            time.sleep(1.0)
        else:
            print(f"      [Aviso] Instrucción {agent_type} no existe. Creando nueva...")
            try:
                crear_btns = list(
                    pyautogui.locateAllOnScreen(IMG_CREATE_INSTR, grayscale=True, confidence=0.8)
                )
            except Exception:
                crear_btns = []

            if len(crear_btns) >= 2:
                menus_ordenados = sorted(crear_btns, key=lambda m: m.top)
                pyautogui.click(pyautogui.center(menus_ordenados[1]))
            elif len(crear_btns) == 1:
                pyautogui.click(pyautogui.center(crear_btns[0]))
            time.sleep(1.5)

            pyautogui.click(1500, 180)  # Área de texto
            time.sleep(0.5)

            file_path = f"{agent_type.lower()}.txt"
            try:
                with open(file_path, encoding="utf-8") as f:
                    sys_prompt_content = f.read()
            except FileNotFoundError:
                raise Exception(f"Falta el archivo {file_path} en la raíz.")

            pyperclip.copy(sys_prompt_content)
            pyautogui.hotkey("ctrl", "v")
            time.sleep(1.0)

            # Título
            pyautogui.moveTo(10, 10)
            time.sleep(0.5)
            title_btn = safe_locate(IMG_TITLE_INSTR, conf=0.8)
            if title_btn:
                pyautogui.click(pyautogui.center(title_btn))
                time.sleep(0.5)
                pyperclip.copy(agent_type)
                pyautogui.hotkey("ctrl", "v")
                time.sleep(0.5)
                pyautogui.press("enter")

    # 4. Quitar foco final para dejar la UI lista para recibir prompts
    pyautogui.click(screen_width / 2, screen_height / 2)
    pyautogui.moveTo(10, 10)  # Ratón fuera de la pantalla
    print("✅ Operación de entorno finalizada.")
    time.sleep(1.0)


def execute_rpa_task(prompt_text):
    print("\n" + "=" * 40)
    print("🚀 EJECUCIÓN MODO REPARACIÓN (MODULAR)")
    print("=" * 40)

    # ---------------------------------------------------------
    # 0. PRE-CHECK VISUAL: ¿ESTÁ ABIERTO AI STUDIO?
    # ---------------------------------------------------------
    print("   [Visión] Verificando si Google AI Studio está visible en pantalla...")
    try:
        # Buscamos el logo con un 80% de confianza
        logo_visible = pyautogui.locateOnScreen(IMG_AISTUDIO_LOGO, grayscale=True, confidence=0.8)

        if not logo_visible:
            # Si devuelve None, la imagen no está en la pantalla
            raise Exception("AISTUDIO_NOT_FOUND")

        print("      [MATCH] Logo detectado. La interfaz está lista.")

    except Exception:
        # PyAutoGUI lanza pyscreeze.ImageNotFoundException en versiones nuevas si no halla la imagen
        raise Exception("AISTUDIO_NOT_FOUND")

    print("   [Pausa] Tienes 3 segundos para cambiar a la pestaña de AI Studio...")
    time.sleep(3)

    # 1. FORZAR FOCO EN LA VENTANA DE CHROME
    try:
        subprocess.run(["wmctrl", "-a", "Google Chrome"], check=False)
        time.sleep(1)
    except:
        pass

    screen_width, screen_height = pyautogui.size()

    # ---------------------------------------------------------
    # 1.5 LIMPIEZA VISUAL: CLIC CENTRO -> END
    # ---------------------------------------------------------
    print("   [Acción] Dando clic en el centro para ganar foco de scroll...")

    # Clic en el centro exacto de la pantalla (Zona Muerta de texto)
    pyautogui.click(screen_width / 2, screen_height / 2)
    time.sleep(0.5)

    # Forzamos scroll al fondo absoluto
    print("   [Acción] Pulsando END para ir al final de la página...")
    pyautogui.press("end")
    time.sleep(1.0)  # Espera a que termine el desplazamiento visual

    # ---------------------------------------------------------
    # 2. SELECCIONAR CAJA (COORDENADAS DESDE EL FONDO)
    # ---------------------------------------------------------
    print("   [Acción] Calculando posición de la caja de texto...")
    target_x = screen_width / 2
    target_y = screen_height - 85

    pyautogui.moveTo(target_x, target_y, duration=0.5)
    pyautogui.click(clicks=3)
    time.sleep(0.5)
    pyautogui.press("backspace")
    time.sleep(0.5)

    # 3. PEGAR TEXTO LIMPIO
    print("   [Acción] Limpiando etiquetas del prompt...")
    texto_limpio = clean_prompt_text(prompt_text)

    print(f"   [Acción] Transfiriendo {len(texto_limpio)} caracteres al portapapeles...")
    pyperclip.copy(texto_limpio)
    time.sleep(1.5)

    print("   [Acción] Pegando texto y código de golpe...")
    pyautogui.hotkey("ctrl", "v")
    time.sleep(2)

    # ---------------------------------------------------------
    # 3.5 DISPARAR EL PROMPT Y CHEQUEO INMEDIATO DE LÍMITE
    # ---------------------------------------------------------
    print("   [Acción] Disparando el prompt (Ctrl + Enter)...")
    pyautogui.hotkey("ctrl", "enter")
    time.sleep(1.0)  # Espera breve para renderizado inicial de error

    # SEGURIDAD 1: Chequeo inmediato tras pulsar enter
    if check_for_rate_limit():
        raise RateLimitReachedException("Se alcanzó el límite de cuota inmediatamente.")

    # ---------------------------------------------------------
    # 4. ESPERA DINÁMICA DE GENERACIÓN (CON CENTINELA DE LÍMITE)
    # ---------------------------------------------------------
    print("   [Acción] Esperando a que inicie la generación...")

    # Clic neutral seguro en el centro de la pantalla
    pyautogui.click(screen_width / 2, screen_height / 2)

    spinner_aparecio = False
    print("      -> Vigilando spinner o mensaje de error...")
    # 4.A - ESPERAR A QUE APAREZCA EL BOTÓN O EL ERROR (Max 15 segundos)
    for i in range(15):
        if is_spinner_visible():
            spinner_aparecio = True
            print(f"      [Match] Spinner detectado en seg {i + 1}. Generación en curso...")
            break

        # SEGURIDAD 2: Chequeo dentro del bucle de espera
        if check_for_rate_limit():
            raise RateLimitReachedException(
                "Se alcanzó el límite de cuota mientras se esperaba generación."
            )

        time.sleep(1)

    if not spinner_aparecio:
        print("      [Aviso] El spinner nunca apareció.")
    else:
        # 4.B - ESPERAR A QUE DESAPAREZCA EL BOTÓN (Con chequeo de error intermitente)
        while is_spinner_visible():
            # SEGURIDAD 3: A veces el error sale a mitad de camino y el stop desaparece rápido
            if check_for_rate_limit():
                raise RateLimitReachedException(
                    "Se alcanzó el límite de cuota durante la generación."
                )
            time.sleep(1.0)  # Polling más lento para no saturar CPU

        print("      [Estado] Generación base finalizada.")

    # ---------------------------------------------------------
    # 5. ESTABILIZACIÓN EN EL FONDO (CON CHEQUEO FINAL)
    # ---------------------------------------------------------
    # SEGURIDAD 4: Chequeo final antes de empezar a mover la página
    if check_for_rate_limit():
        raise RateLimitReachedException("Límite de cuota detectado antes de estabilizar fondo.")

    print("   [Visión] Forzando ir al final para verificar estabilización...")

    # (Ya hicimos clic de foco estéril arriba, no hace falta repetirlo)
    # Definir una REGIÓN DE CORTE (Ignorar barra de tareas arriba y abajo)
    margen_y = 150
    region_segura = (0, margen_y, screen_width, screen_height - (margen_y * 2))

    intentos_est = 0
    while intentos_est < 15:  # Reducimos el límite a 15 por seguridad
        pyautogui.press("end")
        time.sleep(0.5)
        # Tomamos foto SOLO de la región central
        foto_anterior = pyautogui.screenshot(region=region_segura)

        print("      -> Esperando 1.5s para comprobar si hay texto nuevo...")
        time.sleep(1.5)

        pyautogui.press("end")
        time.sleep(0.5)
        foto_nueva = pyautogui.screenshot(region=region_segura)

        diferencia = ImageChops.difference(foto_anterior, foto_nueva)
        if not diferencia.getbbox():
            print("      [Match] Fotos idénticas en el fondo. La respuesta terminó.")
            break
        else:
            print("      [Cambio detectado] Pixel distinto (posible texto nuevo). Repitiendo...")
            intentos_est += 1

    if intentos_est >= 15:
        print("      [AVISO] Límite de estabilización alcanzado. Forzando paso a cacería...")

    # ---------------------------------------------------------
    # 6. CACERÍA DEL MENÚ MARKDOWN (MÉTODO ESTRICTO CON ANCLA)
    # ---------------------------------------------------------
    print("   [Acción] Subiendo para buscar la barra principal de herramientas...")

    # Foco en el centro de la pantalla
    pyautogui.click(screen_width / 2, screen_height / 2)
    time.sleep(0.5)

    intentos_scroll = 0
    MAX_SCROLL = 40
    extraccion_exitosa = False

    # Limpiamos portapapeles por seguridad
    pyperclip.copy("")

    while intentos_scroll < MAX_SCROLL:
        try:
            # PASO 1: Buscar PRIMERO la barra completa (tool_full_content.png)
            barra_visible = pyautogui.locateOnScreen(IMG_TOOL_FULL, grayscale=True, confidence=0.8)

            if barra_visible:
                print("      [MATCH] Barra inferior encontrada. Buscando los menús...")
                time.sleep(0.5)  # Pausa para asegurar que terminó el scroll

                # PASO 2: Ahora que vemos la barra, buscamos los menús de 3 puntos
                menus = list(
                    pyautogui.locateAllOnScreen(IMG_TOOL_MENU, grayscale=True, confidence=0.8)
                )

                if len(menus) >= 2:
                    print(
                        f"      => Visibles {len(menus)} menús. Seleccionando el de la barra (el segundo)..."
                    )
                    menus_ordenados = sorted(menus, key=lambda m: m.top)
                    menu_objetivo = menus_ordenados[1]

                    # Clic en el centro del segundo menú
                    pyautogui.click(pyautogui.center(menu_objetivo))
                    print("      [Acción] Desplegando menú...")
                    time.sleep(1.0)  # Tiempo vital para que la animación del menú termine

                    # PASO 3: Buscar la opción "Copy content as markdown"
                    # Usamos confidence=0.9 para que NO lo confunda con el botón de copiar normal
                    try:
                        copy_md_loc = pyautogui.locateOnScreen(
                            IMG_COPY_MD, grayscale=True, confidence=0.9
                        )
                        if copy_md_loc:
                            print("      [MATCH] ¡Opción Markdown encontrada! Haciendo clic...")
                            pyautogui.click(pyautogui.center(copy_md_loc))
                            time.sleep(0.5)  # Esperamos a que se copie al portapapeles
                            extraccion_exitosa = True
                            break
                        else:
                            print(
                                "      [Aviso] Se abrió el menú pero no se vio la opción Markdown. Cerrando y subiendo..."
                            )
                            # Clic fuera para cerrar el menú flotante
                            pyautogui.click(screen_width / 2, screen_height / 2)
                            time.sleep(0.5)
                    except Exception:
                        pass

        except Exception:
            # Si no encuentra la barra, seguimos bajando el except
            pass

        # Si no encontramos el flujo completo, subimos 3 toques
        pyautogui.press("up", presses=3)
        time.sleep(0.5)
        intentos_scroll += 1

    # ---------------------------------------------------------
    # 7. RETORNO DEL PAYLOAD
    # ---------------------------------------------------------
    if not extraccion_exitosa:
        print("   ❌ [Error] No se pudo extraer el Markdown tras 40 scrolls.")
        raise Exception("Fallo en la extracción del Markdown. Revisa las imágenes.")

    contenido_final = pyperclip.paste()

    if not contenido_final.strip():
        print("   ❌ [Error] Se hizo clic en copiar Markdown pero el portapapeles está vacío.")
        raise Exception("Portapapeles vacío tras intento de copia.")

    print(f"✅ ÉXITO TOTAL: Markdown extraído limpiamente ({len(contenido_final)} caracteres).")
    return contenido_final


def switch_tab(agent_type: str):
    print(f"\n🔄 [TAB SWITCH] Cambiando a la pestaña de {agent_type.upper()}...")

    # 1. Aseguramos que la ventana de Chrome esté activa (Esto se mantiene igual)
    try:
        # wmctrl es específico de Linux, si usas Windows/Mac, esta línea no hará nada.
        subprocess.run(["wmctrl", "-a", "Google Chrome"], check=False)
        time.sleep(0.3)  # Pausa breve para foco
    except:
        pass

    agent_type = agent_type.lower()

    # 2. RPA Standard: Usamos Hotkeys (Atajos de teclado)
    # En casi todos los navegadores: Ctrl + 1 va a la TAB 1, Ctrl + 2 a la TAB 2, etc..

    if agent_type == "skarch":
        # SKARCH es el primero (izquierda), por ende Ctrl + 1
        pyautogui.hotkey("ctrl", "1")
        print("   [Acción] Pulsado Ctrl + 1 (Foco en Pestaña 1 - SKARCH).")

    elif agent_type == "skdev":
        # SKDEV es el segundo, por ende Ctrl + 2
        pyautogui.hotkey("ctrl", "2")
        print("   [Acción] Pulsado Ctrl + 2 (Foco en Pestaña 2 - SKDEV).")
    else:
        # Esta seguridad en la API ya está, pero no está de más aquí.
        raise ValueError(f"Agente desconocido: {agent_type}")

    # Pausa ligeramente más larga para asegurar que la pestaña cargó visualmente.
    time.sleep(0.8)
    print("✅ Pestaña cambiada con éxito.")
