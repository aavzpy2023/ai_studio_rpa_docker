import os
import pyautogui

# --- CONFIGURACIÓN DE PYAUTOGUI ---
pyautogui.FAILSAFE = True
pyautogui.PAUSE = 0.5 

# --- RUTAS DE IMÁGENES (ASSETS) ---
ASSETS_DIR = "assets"
IMG_BEGIN_CODE = os.path.join(ASSETS_DIR, "begin_code.png")
IMG_TOOL_BUTTON = os.path.join(ASSETS_DIR, "tool_button.png")
IMG_INPUT_BOX = os.path.join(ASSETS_DIR, "input_box.png")
IMG_RUN_BUTTON = os.path.join(ASSETS_DIR, "run_button.png")
IMG_LOADING_SPINNER = os.path.join(ASSETS_DIR, "loading_spinner.png")
IMG_COPY_BUTTON = os.path.join(ASSETS_DIR, "copy_button.png")
IMG_CODE_SYMBOL = os.path.join(ASSETS_DIR, "code_symbol.png")
IMG_AISTUDIO_LOGO = os.path.join(ASSETS_DIR, "aistudio.png")
IMG_RATE_LIMIT = os.path.join(ASSETS_DIR, "limit_reached.png")
IMG_TOOL_FULL = os.path.join(ASSETS_DIR, "tool_full_content.png")
IMG_TOOL_MENU = os.path.join(ASSETS_DIR, "tool_menu_content.png")
IMG_COPY_MD = os.path.join(ASSETS_DIR, "tool_copy_md_content.png")
IMG_PRO_MODEL = os.path.join(ASSETS_DIR, "pro_model.png")
IMG_SYS_INSTR = os.path.join(ASSETS_DIR, "system_instructions.png")
IMG_LIST_INSTR = os.path.join(ASSETS_DIR, "list_instructions.png")
IMG_SKARCH_INSTR = os.path.join(ASSETS_DIR, "skarch_instructions.png")
IMG_SKDEV_INSTR = os.path.join(ASSETS_DIR, "skdev_instructions.png")
IMG_CREATE_INSTR = os.path.join(ASSETS_DIR, "create_new_instruction.png")
IMG_TITLE_INSTR = os.path.join(ASSETS_DIR, "create_title_instructions.png")
IMG_AISTUDIO_TAB = os.path.join(ASSETS_DIR, "aistudio_tab.png")



