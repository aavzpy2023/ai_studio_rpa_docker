import os
from datetime import datetime
from config import ExportConfig, PATHS_TO_EXCLUDE
from compression import compress_python_code, compress_typescript_code

def generate_manifest_header(config: ExportConfig, processed_count: int, modules: list) -> str:
    manifest =[
        "=== SK-CONTEXT MANIFEST ===",
        f"Intent: {config.intent_name}",
        f"Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
        f"AST Mode: {config.use_ast}",
        f"Line Numbers: {config.use_line_numbers}",
        f"Modules: {', '.join(modules) if modules else 'Global/Custom'}",
        f"Processed Files: {processed_count}",
        "===========================\n\n"
    ]
    return "\n".join(manifest)

def generate_project_tree(start_dirs, files_to_process):
    tree_lines =["Árbol de directorios de archivos exportados:\n"]
    processed_files_set = {os.path.normpath(f) for f in files_to_process}
    dirs_to_iterate = start_dirs if isinstance(start_dirs, list) else [start_dirs]

    for base_dir in dirs_to_iterate:
        if not os.path.exists(base_dir): continue
        tree_lines.append(f"\n--- Raíz de escaneo: {base_dir} ---\n")

        for root, dirs, files in os.walk(base_dir, topdown=True):
            dirs[:] =[
                d for d in dirs
                if os.path.normpath(os.path.join(root, d) + os.sep) not in[os.path.normpath(p) for p in PATHS_TO_EXCLUDE if p.endswith("/") or p.endswith("\\")]
                and d not in [".git", "__pycache__", "node_modules", ".venv"]
            ]
            rel_path = os.path.relpath(root, base_dir)
            level = 0 if rel_path == "." else rel_path.count(os.sep) + 1
            indent = "│   " * level
            dirname = os.path.basename(root)

            if level != 0: tree_lines.append(f"{indent}├── {dirname}/\n")
            sub_indent = "│   " * (level + 1)
            display_files =[f for f in files if os.path.normpath(os.path.join(root, f)) in processed_files_set]
            for f in sorted(display_files):
                tree_lines.append(f"{sub_indent}├── {f}\n")
    return "".join(tree_lines)

def export_project_content(project_files_list, config: ExportConfig, selected_names: list):
    print(f"\nIniciando exportación Pipeline[{config.intent_name}] hacia '{config.content_file}'...")
    try:
        with open(config.content_file, "w", encoding="utf-8") as outfile:
            outfile.write(generate_manifest_header(config, len(project_files_list), selected_names))
            processed_count = 0
            for file_path in project_files_list:
                outfile.write(f"\n\n// --- {file_path} ---\n\n")
                try:
                    with open(file_path, "r", encoding="utf-8") as infile:
                        content = infile.read()
                        if config.use_ast:
                            if file_path.endswith(".py"): content = compress_python_code(content)
                            elif file_path.endswith((".ts", ".tsx")): content = compress_typescript_code(content)
                        if config.use_line_numbers:
                            content = "\n".join([f"{idx:04d} | {line}" for idx, line in enumerate(content.splitlines(), 1)])
                        outfile.write(content + "\n")
                    print(f"  [OK] Procesado: {file_path}")
                    processed_count += 1
                except Exception as e:
                    outfile.write(f"*** ERROR AL LEER: {file_path} | {e} ***\n")
            print(f"\nCompletado. {processed_count} archivos exportados.")
    except IOError as e:
        print(f"[ERROR CRÍTICO] I/O: {e}")

def write_project_tree(tree_content, config: ExportConfig):
    try:
        with open(config.tree_file, "w", encoding="utf-8") as treefile:
            treefile.write(tree_content)
        print(f"El árbol ha sido guardado en '{config.tree_file}'.")
    except IOError as e:
        print(f"[ERROR CRÍTICO] Error escribiendo árbol: {e}")
