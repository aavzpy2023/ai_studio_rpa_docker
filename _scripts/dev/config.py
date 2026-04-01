from dataclasses import dataclass


@dataclass
class ExportConfig:
    intent_name: str
    use_ast: bool
    use_line_numbers: bool
    content_file: str
    tree_file: str

DEFAULT_DIRECTORIES_TO_SCAN = ["."]

GLOBAL_CONTEXT =[
    "backend/src/main.py",
    "backend/src/app.py",
    "backend/src/infrastructure",
    "backend/src/config",
    "backend/pyproject.toml",
    "frontend-react/src/App.tsx",
    "frontend-react/src/main.tsx",
    "frontend-react/vite.config.ts"
]

SHARED_DIRECTORIES =[
    "backend/src/shared",
    "backend/migrations",
    "frontend-react/src/shared",
    "backend/src/users",
    "frontend-react/src/user",
    "frontend-react/src/auth",
    "backend/migrations",
]

MODULE_DEFINITIONS = {
    "accounts": ["backend/src/accounts", "frontend-react/src/contacts"],
    "chat":["backend/src/chat", "frontend-react/src/inventory"],
    
}

FILE_EXTENSIONS_TO_INCLUDE = (
    ".py", ".yml", ".sh", ".env", ".conf", ".txt", ".md", ".json", ".html",
    "Dockerfile", ".jsx", ".css", ".js", ".ts", ".tsx", ".ini",
)

PATHS_TO_EXCLUDE =[
    ".ruff_cache", "docker-compose.yml", "nginx/default.conf",
    "docker-compose_dev.yml", ".git/", "__pycache__/", ".venv/",
    ".vscode/", "frontend-react/node_modules/", "node_modules/",
    "frontend/build/", ".mypy_cache/", "backend/.venv/",
    "backend/.mypy_cache/", "frontend-react/package-lock.json",
    "frontend-react/postcss.config.js", "frontend-react/dist/",
    "full_project_content_export.txt", "project_structure_tree.txt",
    "export_project_old.py", "volumes/", ".zed/", "backend/build/",
    "backend/src/_module_template/", ".pytest_cache/",
    "backend/src/ai_assistant.egg-info/", "documents/", "tree.txt",
    "get_clean_db.sh", "install_dev_env.sh", "data/01_restore.sh",
    "package-lock.json", "README.md", "backend/README.md", ".opencode"
]
