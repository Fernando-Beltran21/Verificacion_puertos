#!/bin/bash

# Validar que se haya proporcionado el puerto como argumento
if [ -z "$1" ]; then
    echo "Error: Falta el número de puerto."
    echo "Uso: $0 <puerto> [ip_destino]"
    exit 1
fi

PUERTO=$1
# Si no se pasa una IP como segundo argumento, usa localhost por defecto
HOST=${2:-127.0.0.1}

# Validar que el puerto sea un número entre 1 y 65535
if ! [[ "$PUERTO" =~ ^[0-9]+$ ]] || [ "$PUERTO" -lt 1 ] || [ "$PUERTO" -gt 65535 ]; then
    echo "Error: El puerto debe ser un número entero entre 1 y 65535."
    exit 1
fi

# Intentar abrir una conexión TCP de forma silenciosa
(echo > /dev/tcp/$HOST/$PUERTO) >/dev/null 2>&1

# El código de salida ($?) será 0 si la conexión fue exitosa
if [ $? -eq 0 ]; then
    echo "✅ El puerto $PUERTO en $HOST está ABIERTO."
else
    echo "❌ El puerto $PUERTO en $HOST está CERRADO."
fi