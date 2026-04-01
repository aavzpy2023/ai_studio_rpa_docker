# 1. Crear el directorio de binarios locales si no existe
mkdir -p ~/.local/bin

# 2. Crear el script a prueba de balas
cat <<'EOF' > ~/.local/bin/open-vnc.sh
#!/bin/bash
# Intercepta: vnc://127.0.0.1:5900
URI="$1"

# Extrae solo la IP y el Puerto (127.0.0.1:5900)
TARGET="${URI#vnc://}"

# Genera un archivo físico de perfil de Remmina al vuelo
TMP_FILE="/tmp/ai_pooler_auto.remmina"
echo "[remmina]" > "$TMP_FILE"
echo "name=AI Studio Login" >> "$TMP_FILE"
echo "protocol=VNC" >> "$TMP_FILE"
echo "server=$TARGET" >> "$TMP_FILE"
echo "colordepth=32" >> "$TMP_FILE"
echo "viewmode=1" >> "$TMP_FILE"

# Ejecuta Remmina usando el archivo físico
remmina -c "$TMP_FILE"
EOF

# 3. Dar permisos de ejecución al script
chmod +x ~/.local/bin/open-vnc.sh

# 4. Actualizar el Desktop Entry para que use nuestro script
cat <<EOF > ~/.local/share/applications/remmina-vnc-handler.desktop
[Desktop Entry]
Name=Remmina VNC Handler
Exec=$HOME/.local/bin/open-vnc.sh %U
Type=Application
Terminal=false
MimeType=x-scheme-handler/vnc;
NoDisplay=true
EOF

# 5. Refrescar la caché de Ubuntu
update-desktop-database ~/.local/share/applications/
xdg-mime default remmina-vnc-handler.desktop x-scheme-handler/vnc