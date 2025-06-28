#!/bin/bash

# Configuración
archivo="tu_server.jar" #colocas el nombre del archivo del servidor
memoria_max="12G" # colocas la ram que quieras ponerle al servidor en este caso esta en 12G pero es recomendable entre 4G y 8G para jugar de entre 2 y 5 jugadores.
memoria_min="4G" # colocas la ram minima que quieras ponerle al servidor yo lo dejaria en 4G es lo mas recomendable.

echo "eula=true" > eula.txt # sirve para haceptar el eula automaticamente.

# Verificar si el archivo JAR existe
if [ ! -f "$archivo" ]; then
    echo "Error: No se encontró $archivo. ¿Estás en el directorio correcto?"
    exit 1
fi

# Iniciar Minecraft
echo "servidor de minecraft iniciado. ahora has en otra terminal: ./startp.sh"
java -Xmx"$memoria_max" -Xms"$memoria_min" -jar "$archivo" nogui
echo "servidor de minecraft cerrado, espero que les alla gustado"
