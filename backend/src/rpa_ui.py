import subprocess
import time

import pyautogui
import pyperclip


def focus_chrome():
    """Fuerza el foco en la ventana de Google Chrome."""
    try:
        subprocess.run(["wmctrl", "-a", "Google Chrome"], check=False)
        time.sleep(1)
    except Exception:
        pass


def click_center():
    """Hace clic en el centro exacto de la pantalla (zona muerta)."""
    screen_width, screen_height = pyautogui.size()
    pyautogui.click(screen_width / 2, screen_height / 2)
    time.sleep(0.5)


def move_mouse_away():
    """Mueve el ratón a la esquina para no interferir visualmente."""
    pyautogui.moveTo(10, 10)
    time.sleep(0.5)


def copy_to_clipboard(texto: str):
    """Limpia y copia el texto al portapapeles."""
    pyperclip.copy(texto)
    time.sleep(1.5)


def clear_clipboard():
    """Limpia el portapapeles por seguridad."""
    pyperclip.copy("")
