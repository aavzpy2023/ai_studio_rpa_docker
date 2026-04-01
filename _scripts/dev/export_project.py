
import os
import sys

# Importación de la nueva arquitectura modular
from config import DEFAULT_DIRECTORIES_TO_SCAN, FILE_EXTENSIONS_TO_INCLUDE, \
    PATHS_TO_EXCLUDE
from cli import get_user_selection
from discovery import find_project_files, filter_excluded_paths, apply_selection_logic
from generator import generate_project_tree, write_project_tree, export_project_content

if __name__ == "__main__":
    # 1. Selección y Configuración
    config, selection_type, selection_data, selected_names = get_user_selection()

    if selection_type in ['module', 'custom']:
        directories_to_scan = selection_data
    else:
        directories_to_scan = DEFAULT_DIRECTORIES_TO_SCAN

    # 2. Escaneo de Archivos Base
    all_project_files = find_project_files(directories_to_scan,
                                           FILE_EXTENSIONS_TO_INCLUDE)

    # 3. Filtrados Estáticos y Dinámicos
    print("\nAplicando filtros de exclusión globales y dinámicos...")
    globally_filtered_files = filter_excluded_paths(all_project_files, PATHS_TO_EXCLUDE)
    files_to_process = apply_selection_logic(globally_filtered_files, selection_type)

    print(f"Total de archivos a procesar final: {len(files_to_process)}")

    if not files_to_process:
        print("\nNo se encontraron archivos que procesar. Saliendo.")
    else:
        # 4. Generación de Árbol
        full_scan = find_project_files(DEFAULT_DIRECTORIES_TO_SCAN,
                                       FILE_EXTENSIONS_TO_INCLUDE)
        tree_files = filter_excluded_paths(full_scan, PATHS_TO_EXCLUDE)
        project_tree = generate_project_tree(DEFAULT_DIRECTORIES_TO_SCAN, tree_files)

        # 5. Pipeline de I/O y Escritura (AST/LineNumbers)
        write_project_tree(project_tree, config)
        export_project_content(files_to_process, config, selected_names)
