import time

import pyautogui
from PIL import ImageChops


def safe_locate(image_path, conf=0.8):
    """Busca una imagen y devuelve None si no la encuentra, evitando que el bot explote."""
    try:
        return pyautogui.locateOnScreen(image_path, grayscale=True, confidence=conf)
    except Exception:
        return None


def wait_for_screen_stabilization(max_intentos=15, margen_y=150):
    """Verifica si la pantalla dejó de generar texto comparando capturas."""
    screen_width, screen_height = pyautogui.size()
    region_segura = (0, margen_y, screen_width, screen_height - (margen_y * 2))

    intentos = 0
    while intentos < max_intentos:
        pyautogui.press("end")
        time.sleep(0.5)
        foto_anterior = pyautogui.screenshot(region=region_segura)

        print("      -> Esperando 1.5s para comprobar si hay texto nuevo...")
        time.sleep(1.5)

        pyautogui.press("end")
        time.sleep(0.5)
        foto_nueva = pyautogui.screenshot(region=region_segura)

        diferencia = ImageChops.difference(foto_anterior, foto_nueva)
        if not diferencia.getbbox():
            print("      [Match] Fotos idénticas en el fondo. La respuesta terminó.")
            return True
        else:
            print("      [Cambio detectado] Pixel distinto (posible texto nuevo). Repitiendo...")
            intentos += 1

    return False
