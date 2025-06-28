#!/bin/bash

# Define el nombre del archivo indicador
primera_vez=".primer_inicio_playit"

chmod +x playit-linux-amd64
# Ejecutamos Playit en segundo plano y guardamos su salida en playit.log
nohup ./playit-linux-amd64 > playit.log 2>&1 &

# Esperamos un poco para que Playit.gg se inicie y escriba en el log
sleep 10

# Extraer la IP de conexión.
playit_ip=$(grep -a -o "[a-zA-Z0-9.-]*.gl.joinmc.link" playit.log | head -n 1)
# Extraer el enlace de reclamación 
reclamo=$(grep -a -o "https://playit.gg/claim/[0-9a-zA-Z]*" playit.log | head -n 1)

echo "" # Línea en blanco para estética

if [ ! -f "$primera_vez" ]; then
    # Si el archivo indicador NO existe, es la PRIMERA EJECUCIÓN
    echo "╔═════════════════════════════════════════════════╗"
    echo "║ ✨ ¡Bienvenido! Configurando tu servicio inicial.║"
    echo "║ ----------------------------------------------- ║"
    echo "║ Esto solo aparecerá la primera vez.             ║"
    echo "║                                                 ║"
    if [ -n "$reclamo" ]; then
        echo "║  ¡Paso Importante! Reclama tu Agente Playit.gg  ║"
        echo "╠═════════════════════════════════════════════════╣"
        echo "║ Por favor, visita este enlace en tu navegador:  ║"
        echo "║                                                 ║"
        echo "║ 🔗 ENLACE DE RECLAMACIÓN:                       ║"
        echo "║    --> $reclamo                                 ║"
        echo "║                                                 ║"
        echo "║ Una vez reclamado, tu servicio estará activo.   ║"
    else
        echo "║ ⚠️  No se encontró el enlace de reclamación.     ║"
        echo "║    Revisa playit.log para obtenerlo manualmente.║"
    fi
    echo "╚═════════════════════════════════════════════════╝"
    echo ""
    # Crea el archivo indicador para que las futuras ejecuciones no muestren este mensaje
    touch "$primera_vez"
    sleep 5 
fi

echo "╔═════════════════════════════════════════════════╗"
echo "║             ¡Servicio a través de Playit.gg!    ║"
echo "╠═════════════════════════════════════════════════╣"

if [ -z "$playit_ip" ]; then
    echo "║ ⚠️  No pudimos obtener la dirección de Playit.gg. ║"
    echo "║    valla a playit.log y copialo desde ay.         ║"
else
    echo "║ ✅     playit funcionando sin problema.         ║"
    echo "║                                                 ║"
    echo "║ Para que TÚ y tus amigos se conecten:           ║"
    echo "║                                                 ║"
    echo "║ 🌐  DIRECCIÓN DE CONEXIÓN:                      ║"
    echo "║     -->  $playit_ip                             ║"
    echo "║                                                 ║"
    echo "║                  Playit.gg                      ║"
    echo "║                                                 ║"
    echo "║                                                 ║"
fi
echo "╚═════════════════════════════════════════════════╝"
echo ""
