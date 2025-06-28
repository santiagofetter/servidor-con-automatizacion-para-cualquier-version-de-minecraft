#!/bin/bash
echo "  ╔══════════════════════════════════════════════════════╗"
echo "  ║      ██████╗ ██╗      █████╗ ██╗   ██╗██╗████████╗   ║"
echo "  ║      ██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝██║╚══██╔══╝   ║"
echo "  ║      ██████╔╝██║     ███████║ ╚████╔╝ ██║   ██║      ║"
echo "  ║      ██╔═══╝ ██║     ██╔══██║  ╚██╔╝  ██║   ██║      ║"
echo "  ║      ██║     ███████╗██║  ██║   ██║   ██║   ██║      ║"
echo "  ║      ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝   ╚═╝      ║"
echo "  ║                          .gg                         ║"
echo "  ╠══════════════════════════════════════════════════════╣"

# Iniciar Playit en segundo plano y capturar la IP
chmod +x playit-linux-amd64
nohup ./playit-linux-amd64 > playit.log 2>&1 &

# Esperar 5 segundos para que Playit genere la IP
sleep 5

# Extraer la IP del log
PLAYIT_IP=$(grep -a -o "[a-zA-Z0-9.-]*.gl.joinmc.link" playit.log | head -n 1)

echo ""
echo "╔═════════════════════════════════════════════════╗"
echo "║             ¡Servicio a través de Playit.gg!    ║"
echo "╠═════════════════════════════════════════════════╣"

if [ -z "$PLAYIT_IP" ]; then
    echo "║ ⚠️  No pudimos obtener la dirección de Playit.gg. ║"
    echo "║    Por favor, revisa el archivo playit.log.     ║"
else
    echo "║ ✅ playit marchando sin problema                ║"
    echo "║                                                 ║"
    echo "║ Para que TÚ y tus amigos se conecten:           ║"
    echo "║                                                 ║"
    echo "║ 🌐  DIRECCIÓN DE CONEXIÓN:                      ║"
    echo "║     -->  $PLAYIT_IP                             ║"
    echo "║                                                 ║"
    echo "║                 Playit.gg                       ║"
    echo "║                                                 ║"
    echo "║                                                 ║"
fi
echo     "╚═════════════════════════════════════════════════╝"
echo ""
