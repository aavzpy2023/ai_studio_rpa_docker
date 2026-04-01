import pyautogui
from config import IMG_LOADING_SPINNER, IMG_RATE_LIMIT


# --- EXCEPCIONES PERSONALIZADAS ---
class RateLimitReachedException(Exception):
    """Excepción lanzada cuando se detecta visualmente el límite de cuota."""
    pass


def save_debug_snapshot(name):
    """Guarda una captura de pantalla para depuración."""
    filename = f"debug_{name}.png"
    pyautogui.screenshot(filename)
    print(f"      [Debug] Screenshot saved: {filename}")

def clean_prompt_text(prompt_text):
    """Limpia el prompt eliminando las etiquetas del sistema de la API."""
    texto_limpio = prompt_text
    if "[USER]:" in texto_limpio:
        texto_limpio = texto_limpio.split("[FINAL INSTRUCTION]:")[0]
        texto_limpio = texto_limpio.replace("[USER]:", "").strip()
    return texto_limpio

def is_spinner_visible():
    """Verifica si el botón 'Stop' (spinner) está en pantalla de forma segura."""
    try:
        loc = pyautogui.locateOnScreen(IMG_LOADING_SPINNER, grayscale=True, confidence=0.8)
        return loc is not None
    except Exception:
        return False
    
def check_for_rate_limit():
    """Busca visualmente el mensaje de 'You've reached your rate limit.'."""
    try:
        limit_loc = pyautogui.locateOnScreen(IMG_RATE_LIMIT, grayscale=True, confidence=0.7)
        if limit_loc:
            print("🚨 [CRÍTICO] Detectado mensaje: 'You've reached your rate limit.'")
            return True
    except Exception:
        pass
    return False