#!/bin/bash

PROCESS_NAME="pocketbase.exe"

echo "🚀 ClickListo Watchdog (Windows Mode) iniciado..."

while true; do
  # 1. ¿Está el proceso vivo? (Buscamos en la lista de tareas de Windows)
  if ! tasklist | grep -i "$PROCESS_NAME" > /dev/null; then
    echo "⚠️ $PROCESS_NAME no está corriendo. Reiniciando..."
    ./pocketbase.exe serve &
  else
    # 2. Si está vivo, no hacemos nada (Evitamos el error de puerto ocupado)
    echo "✅ $PROCESS_NAME funcionando correctamente."
  fi

  sleep 60 # Revisamos cada minuto para no estresar la laptop vieja
done