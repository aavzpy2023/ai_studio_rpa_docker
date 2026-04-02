import time

import pyautogui
import pyperclip

from rpa_ui import clear_clipboard, click_center, move_mouse_away
from rpa_vision import safe_locate
from src.config import (
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


def ensure_pro_model():
    print("   [Acción] Asegurando modelo Pro...")
    pyautogui.click(1600, 300)
    time.sleep(1.0)
    move_mouse_away()

    pro_model = safe_locate(IMG_PRO_MODEL, conf=0.8)
    if pro_model:
        pyautogui.click(pyautogui.center(pro_model))
        print("      [MATCH] Modelo Pro seleccionado.")
    else:
        print("      [Aviso] Opción Pro no detectada (Quizás ya estaba activo).")

    # 🔴 CRÍTICO: Clic en el centro para CERRAR el menú desplegable del modelo
    click_center()
    time.sleep(1.0)


def set_system_instructions(agent_type: str):
    print(f"   [Acción] Configurando System Instructions para {agent_type}...")
    move_mouse_away()

    sys_inst = safe_locate(IMG_SYS_INSTR, conf=0.8)
    if sys_inst:
        pyautogui.click(pyautogui.center(sys_inst))
    time.sleep(1.0)

    move_mouse_away()
    list_inst = safe_locate(IMG_LIST_INSTR, conf=0.8)
    if list_inst:
        pyautogui.click(pyautogui.center(list_inst))
    time.sleep(1.5)

    move_mouse_away()
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
        move_mouse_away()
        title_btn = safe_locate(IMG_TITLE_INSTR, conf=0.8)
        if title_btn:
            pyautogui.click(pyautogui.center(title_btn))
            time.sleep(0.5)
            pyperclip.copy(agent_type)
            pyautogui.hotkey("ctrl", "v")
            time.sleep(0.5)
            pyautogui.press("enter")


def hunt_markdown_menu() -> str:
    print("   [Acción] Subiendo para buscar la barra principal de herramientas...")
    click_center()

    intentos_scroll = 0
    MAX_SCROLL = 40
    extraccion_exitosa = False
    clear_clipboard()

    while intentos_scroll < MAX_SCROLL:
        try:
            # PASO 1: Buscar PRIMERO la barra completa
            barra_visible = safe_locate(IMG_TOOL_FULL, conf=0.8)

            if barra_visible:
                print("      [MATCH] Barra inferior encontrada. Buscando los menús...")
                time.sleep(0.5)

                # PASO 2: Buscar los menús de 3 puntos
                menus = list(
                    pyautogui.locateAllOnScreen(IMG_TOOL_MENU, grayscale=True, confidence=0.8)
                )

                if len(menus) >= 2:
                    print(
                        f"      => Visibles {len(menus)} menús. Seleccionando el de la barra (el segundo)..."
                    )
                    menus_ordenados = sorted(menus, key=lambda m: m.top)
                    menu_objetivo = menus_ordenados[1]

                    pyautogui.click(pyautogui.center(menu_objetivo))
                    print("      [Acción] Desplegando menú...")
                    time.sleep(1.0)

                    # PASO 3: Buscar la opción "Copy content as markdown"
                    try:
                        copy_md_loc = pyautogui.locateOnScreen(
                            IMG_COPY_MD, grayscale=True, confidence=0.9
                        )
                        if copy_md_loc:
                            print("      [MATCH] ¡Opción Markdown encontrada! Haciendo clic...")
                            pyautogui.click(pyautogui.center(copy_md_loc))
                            time.sleep(0.5)
                            extraccion_exitosa = True
                            break
                        else:
                            print(
                                "      [Aviso] Se abrió el menú pero no se vio la opción Markdown. Cerrando y subiendo..."
                            )
                            click_center()
                    except Exception:
                        pass

        except Exception:
            pass

        # Si no encontramos el flujo completo, subimos 3 toques
        pyautogui.press("up", presses=3)
        time.sleep(0.5)
        intentos_scroll += 1

    if not extraccion_exitosa:
        print("   ❌ [Error] No se pudo extraer el Markdown tras 40 scrolls.")
        raise Exception("Fallo en la extracción del Markdown. Revisa las imágenes.")

    contenido_final = pyperclip.paste()

    if not contenido_final.strip():
        print("   ❌ [Error] Se hizo clic en copiar Markdown pero el portapapeles está vacío.")
        raise Exception("Portapapeles vacío tras intento de copia.")

    print(f"✅ ÉXITO TOTAL: Markdown extraído limpiamente ({len(contenido_final)} caracteres).")
    return contenido_final
