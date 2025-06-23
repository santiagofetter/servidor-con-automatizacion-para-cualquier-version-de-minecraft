#!/bin/bash

# ----- 1. Aceptar la EULA de Minecraft (si no existe) -----
if [ ! -f eula.txt ]; then
  echo "eula=true" > eula.txt
fi