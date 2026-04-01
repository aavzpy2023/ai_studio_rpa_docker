import ast
import subprocess
import os


def compress_python_code(source_code: str) -> str:
    """Comprime código Python reteniendo solo firmas y docstrings (AST)."""
    try:
        tree = ast.parse(source_code)

        class Stubber(ast.NodeTransformer):
            def visit_FunctionDef(self, node):
                node.body = [ast.Expr(value=ast.Constant(value="..."))]
                return node

            def visit_AsyncFunctionDef(self, node):
                node.body = [ast.Expr(value=ast.Constant(value="..."))]
                return node

            def visit_ClassDef(self, node):
                self.generic_visit(node)
                return node

        return ast.unparse(Stubber().visit(tree))
    except Exception:
        return source_code


def compress_typescript_code(source_code: str) -> str:
    """
    Comprime código TypeScript/React utilizando AST real vía Node (ts-morph).
    Implementa un Fallback elegante a Regex si Node no está disponible.
    """
    script_path = os.path.join(os.path.dirname(__file__), 'ts_compressor.js')

    try:
        # Llamada al proceso de Node.js, pasando el código por stdin
        result = subprocess.run(
            ['node', script_path],
            input=source_code,
            text=True,
            capture_output=True,
            check=True
        )
        return result.stdout
    except (FileNotFoundError, subprocess.CalledProcessError):
        return _compress_typescript_regex(source_code)


def _compress_typescript_regex(source_code: str) -> str:
    """Compresión Regex Legacy (Fallback de seguridad)."""
    lines = source_code.split('\n')
    compressed, in_block, brace_count = [], False, 0

    for line in lines:
        stripped = line.strip()
        if stripped.startswith(
            ("import ", "export interface ", "export type ", "type ", "interface ")):
            compressed.append(line)
            if "{" in line and "}" not in line:
                in_block = True
                brace_count += line.count("{") - line.count("}")
            continue

        if in_block:
            compressed.append(line)
            brace_count += line.count("{") - line.count("}")
            if brace_count <= 0:
                in_block, brace_count = False, 0
            continue

        if stripped.startswith(("export const ", "const ")):
            if "=>" in line or "function" in line:
                compressed.append(line.split("=>")[0] + "=> { /* ... */ };")
            else:
                compressed.append(line)
            continue

        if stripped.startswith(
            ("export function ", "function ", "class ", "export class ")):
            compressed.append(line.split("{")[0] + "{ /* ... */ }")

    return "\n".join(compressed) if compressed else source_code
