#!/bin/bash

# Configuración
MINECRAFT_JAR="server.jar" #colocas el nombre del archivo del servidor
JAVA_MEMORY="12G" # colocas la ram que quieras ponerle al servidor en este caso esta en 12G pero es recomendable entre 4G y 8G para jugar de entre 2 y 5 jugadores.

echo "eula=true" > eula.txt

# Verificar si el archivo JAR existe
if [ ! -f "$MINECRAFT_JAR" ]; then
    echo "Error: No se encontró $MINECRAFT_JAR. ¿Estás en el directorio correcto?"
    exit 1
fi

# Iniciar Minecraft (en primer plano para ver logs en terminal)
echo "servidor de minecraft iniciado. ahora has en otra terminal: ./startp.sh"
java -Xmx"$JAVA_MEMORY" -jar "$MINECRAFT_JAR" nogui
echo "servidor de minecraft cerrado, espero que les alla gustado"
