if [ -z "$USUARIO_BASE" ] || [ -z "$ARCHIVO_LISTA" ]; then
  echo "Uso: $0 <usuario_base> <archivo_lista>"
  exit 1
fi

# Obtener la clave encriptada del usuario base
CLAVE=$(sudo getent shadow "$USUARIO_BASE" | cut -d: -f2)

# Validación de clave
if [ -z "$CLAVE" ]; then
  echo "Error: no se pudo obtener la clave del usuario base"
  exit 2
fi

# Leer línea por línea el archivo
while IFS=: read -r USUARIO GRUPO; do
  echo "creando grupo: $GRUPO"
  sudo groupadd -f "$GRUPO"

  echo "creando usuario: $USUARIO con grupo primario $GRUPO"
  sudo useradd -m -g "$GRUPO" -s /bin/bash "$USUARIO"

  echo "$USUARIO:$CLAVE" | sudo chpasswd -e
done < "$ARCHIVO_LISTA"

echo "alta de usuarios finalizada."
