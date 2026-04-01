import os


def discover_modules(backend_dir="backend/src", frontend_dir="frontend-react/src"):
    """Descubre dinámicamente los módulos de dominio ignorando capas técnicas."""
    ignore_dirs = {"core", "infrastructure", "shared", "config", "users", "auth"}
    modules = {}

    def scan_dir(base_dir):
        if not os.path.exists(base_dir): return
        for item in os.listdir(base_dir):
            path = os.path.join(base_dir, item)
            if os.path.isdir(path) and item not in ignore_dirs and not item.startswith(
                ("_", ".")):
                name = item.capitalize()
                if name not in modules:
                    modules[name] = []
                modules[name].append(path)

    scan_dir(backend_dir)
    scan_dir(frontend_dir)
    return modules


def apply_selection_logic(file_list, selection):
    """Filtra la lista de archivos basándose en la selección del usuario."""
    if selection in ['module', 'custom', '4']:
        return file_list

    filtered_list = []
    frontend_dir = os.path.normpath("frontend-react")
    backend_dir = os.path.normpath("backend")

    print(f"\nAplicando lógica de selección global: Opción {selection}...")

    for file_path in file_list:
        norm_path = os.path.normpath(file_path)

        if selection == '1':  # Backend Only
            if norm_path.startswith(frontend_dir):
                continue
            filtered_list.append(file_path)

        elif selection == '2':  # Frontend Only (con contexto Backend)
            if norm_path.startswith(frontend_dir):
                filtered_list.append(file_path)
                continue

            if not norm_path.startswith(backend_dir):
                filtered_list.append(file_path)
                continue

            # Contexto Backend necesario para Frontend
            is_domain = "domain" in norm_path and "entities" in norm_path
            is_api = "infrastructure" in norm_path and "driving" in norm_path and "api" in norm_path
            is_dto = "application" in norm_path and "dtos.py" in norm_path

            if is_domain or is_api or is_dto:
                filtered_list.append(file_path)
            else:
                continue
        else:
            filtered_list.append(file_path)

    return filtered_list


def find_project_files(base_directories, extensions_to_include):
    found_files = []
    print(f"\nBuscando archivos en: {base_directories}")

    for base_dir in base_directories:
        if not os.path.exists(base_dir):
            print(f"  [ADVERTENCIA] Ruta no encontrada: {base_dir}")
            continue

        if os.path.isfile(base_dir):
            if base_dir.endswith(extensions_to_include):
                found_files.append(base_dir)
            continue

        for root, _, files in os.walk(base_dir):
            for file in files:
                if file.endswith(extensions_to_include):
                    full_path = os.path.join(root, file)
                    found_files.append(full_path)

    print(f"Se encontraron {len(found_files)} archivos candidatos.")
    return sorted(found_files)


def filter_excluded_paths(file_list, exclusion_list):
    normalized_exclusions = [os.path.normpath(p) for p in exclusion_list]
    excluded_dirs = [p for p in normalized_exclusions if
                     p.endswith(os.sep) or (os.path.isdir(p) and not os.path.islink(p))]
    excluded_files = {p for p in normalized_exclusions if p not in excluded_dirs}

    filtered_list = []
    for file_path in file_list:
        normalized_file_path = os.path.normpath(file_path)
        base_name = os.path.basename(normalized_file_path)

        # [Auto-Exclusión]: Prevenir bucles infinitos
        if base_name.startswith("SKARCH_") or base_name.startswith("SKDEV_"):
            continue

        if normalized_file_path in excluded_files:
            continue

        is_in_excluded_dir = False
        for dir_path in excluded_dirs:
            dir_prefix = dir_path if dir_path.endswith(os.sep) else dir_path + os.sep
            if (normalized_file_path + os.sep).startswith(
                dir_prefix) or normalized_file_path.startswith(dir_prefix):
                is_in_excluded_dir = True
                break

        if not is_in_excluded_dir:
            filtered_list.append(file_path)

    return filtered_list
