#!/bin/bash

# Ruta del directorio .devcontainer
DEV_CONTAINER_DIR=".devcontainer"

# Verificar si el directorio .devcontainer existe
if [ -d "$DEV_CONTAINER_DIR" ]; then
    echo "El directorio $DEV_CONTAINER_DIR ya existe. No se realizarán acciones."
    exit 0
else
    echo "El directorio $DEV_CONTAINER_DIR no existe. Creándolo y moviendo archivos..."

    # Crear el directorio .devcontainer
    mkdir -p "$DEV_CONTAINER_DIR"

    # Mover los archivos al directorio .devcontainer (asumiendo que están en el mismo directorio que el script)
    mv chmod.sh "$DEV_CONTAINER_DIR/"
    mv devcontainer.json "$DEV_CONTAINER_DIR/"
    mv automatizador_permisos.json "$DEV_CONTAINER_DIR/"
    mv post_create.sh "$DEV_CONTAINER_DIR/"

    echo "Archivos movidos exitosamente a $DEV_CONTAINER_DIR."
fi