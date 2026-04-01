import os
from config import ExportConfig, MODULE_DEFINITIONS, GLOBAL_CONTEXT, SHARED_DIRECTORIES
from discovery import discover_modules


def resolve_presets(include_shared: bool):
    """Genera el diccionario final de presets de forma
     determinista basándose estrictamente en config.py."""
    presets = {}
    for name, specific_paths in MODULE_DEFINITIONS.items():
        # Clonamos la lista para evitar mutaciones accidentales del GLOBAL_CONTEXT
        full_paths = list(GLOBAL_CONTEXT) + specific_paths
        if include_shared:
            full_paths += SHARED_DIRECTORIES
        presets[name] = full_paths
    return presets


def get_user_selection():
    """Solicita configuración y módulo al usuario."""
    print("\n--- INTENT ORCHESTRATOR ---")
    print("1. Planificación (SKARCH) - Comprime AST, nombres de archivo SKARCH_*")
    print("2. Desarrollo (SKDEV) - Números de línea, nombres de archivo SKDEV_*")
    intent_choice = input("Seleccione Intención [1/2]: ").strip()

    if intent_choice == "1":
        config = ExportConfig(
            intent_name="SKARCH", use_ast=True, use_line_numbers=False,
            content_file="SKARCH_content.txt", tree_file="SKARCH_tree.txt"
        )
    else:
        config = ExportConfig(
            intent_name="SKDEV", use_ast=False, use_line_numbers=True,
            content_file="SKDEV_content.txt", tree_file="SKDEV_tree.txt"
        )

    print(f"\n[INFO] Intención seleccionada: {config.intent_name}")
    print("\n--- CONFIGURACIÓN DE CONTEXTO ---")
    share_input = input(
        "¿Incluir archivos 'shared' (kernel/infra base)? [S/n]: ").strip().lower()
    include_shared = share_input != 'n'
    print(
        f"[INFO] Archivos compartidos: {'INCLUIDOS' if include_shared else 'EXCLUIDOS'}")

    current_presets = resolve_presets(include_shared)
    module_keys = list(current_presets.keys())

    print("\n--- SELECCIÓN DE EXPORTACIÓN ---")
    print("1. Backend Only (Excluye carpeta frontend)")
    print("2. Frontend Only (Incluye Frontend + Entidades y APIs del Backend)")
    print("3. Both (Proyecto completo desde la raíz)")

    start_idx = 4
    for idx, name in enumerate(module_keys, start=start_idx):
        print(f"{idx}. Módulo: {name}")

    custom_idx = start_idx + len(module_keys)
    print(f"{custom_idx}. Directorio(s) Específico(s) (Rutas manuales desde SKARCH)")

    while True:
        choice_input = input(
            f"\nSeleccione opción(es) separadas por coma (1-{custom_idx}): ").strip()

        if choice_input in ['1', '2', '3']:
            return config, choice_input, None, []

        # === NUEVA LÓGICA PARA MÚLTIPLES RUTAS MANUALES (SKARCH COMPATIBLE) ===
        if choice_input == str(custom_idx):
            print("\n[INFO] Puede pegar la lista de rutas generada por SKARCH.")
            print("Ejemplo: [\"backend/src/messages\", \"backend/src/users\"]")
            custom_paths_input = input("Ingrese la(s) ruta(s): ").strip()

            # Limpiador automático: quita corchetes, comillas y apóstrofes
            cleaned_input = custom_paths_input.replace('[', '').replace(']',
                                                                        '').replace('"',
                                                                                    '').replace(
                "'", "")

            # Separar por comas y quitar espacios en blanco
            raw_paths = [p.strip() for p in cleaned_input.split(',') if p.strip()]

            valid_paths = []
            invalid_paths = []

            for p in raw_paths:
                if os.path.exists(
                    p):  # Soporta tanto directorios como archivos específicos
                    valid_paths.append(p)
                else:
                    invalid_paths.append(p)

            if invalid_paths:
                print(
                    f"\n[ADVERTENCIA] No se encontraron las siguientes rutas: {', '.join(invalid_paths)}")
                if not valid_paths:
                    print(
                        "ERROR: Ninguna de las rutas proporcionadas es válida. Intente de nuevo.")
                    continue

                proceed = input(
                    "¿Desea continuar exportando solo las rutas válidas? [S/n]: ").strip().lower()
                if proceed == 'n':
                    continue

            if valid_paths:
                # Extraer los nombres de las carpetas para el log (ej: 'messages', 'users')
                custom_names = [os.path.basename(os.path.normpath(p)) for p in
                                valid_paths]
                print(f"\n[INFO] Rutas manuales validadas: {', '.join(valid_paths)}")
                return config, 'custom', valid_paths, custom_names
            else:
                continue
        # =======================================================================

        try:
            indices = [int(x.strip()) for x in choice_input.split(',') if
                       x.strip().isdigit()]
            if not indices:
                print("Entrada inválida.")
                continue

            selected_paths, selected_names = [], []
            for idx in indices:
                if start_idx <= idx < custom_idx:
                    module_name = module_keys[idx - start_idx]
                    selected_paths.extend(current_presets[module_name])
                    selected_names.append(module_name)
                else:
                    print(f"[WARN] Índice {idx} fuera de rango.")

            if selected_paths:
                print(f"\n[INFO] Módulos seleccionados: {', '.join(selected_names)}")
                return config, 'module', list(set(selected_paths)), selected_names

        except ValueError:
            pass
        print("Opción inválida. Intente de nuevo.")
