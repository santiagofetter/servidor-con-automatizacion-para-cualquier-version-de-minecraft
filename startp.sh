#!/bin/bash

# Iniciar Playit en segundo plano y capturar la IP
nohup ./playit-linux-amd64 > playit.log 2>&1 &

# Esperar 10 segundos para que Playit genere la IP (ajusta si es necesario)
sleep 10

# Extraer la IP del archivo de log y mostrarla
PLAYIT_IP=$(grep -o "https://[a-zA-Z0-9.-]*\.gl\.joinmc\.link" playit.log | head -n 1)

if [ -z "$PLAYIT_IP" ]; then
    echo "Revisa playit.log para ver la ip"
else
    echo ""
    echo "--------------------------------------------------"
    echo "¡Servidor listo! Conéctate usando:"
    echo "IP Pública:  $PLAYIT_IP"
    echo "IP Local:    127.0.0.1:25565"
    echo "--------------------------------------------------"
    echo ""
fi