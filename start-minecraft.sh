#!/bin/bash

# Crea el directorio de mods si no existe
mkdir -p /data/mods

# Lista de URLs de los mods (enlaces de descarga directa desde OneDrive)
MOD_URLS=(
  "https://onedrive.live.com/download?resid=YOUR_RESID_FOR_MOD1"
)

# Descarga y descomprime los mods
for MOD_URL in "${MOD_URLS[@]}"; do
  wget -O /tmp/$(basename $MOD_URL) $MOD_URL
  if [[ $(basename $MOD_URL) == *.zip ]]; then
    unzip -o /tmp/$(basename $MOD_URL) -d /data/mods
  else
    mv /tmp/$(basename $MOD_URL) /data/mods/
  fi
done

# Inicia el servidor de Minecraft
/usr/local/bin/entrypoint.sh
