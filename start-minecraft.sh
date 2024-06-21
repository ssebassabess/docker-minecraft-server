#!/bin/bash

# Crea el directorio de mods si no existe
mkdir -p /data/mods

# Lista de URLs de los mods (enlaces de descarga directa desde OneDrive)
MOD_URLS=(
  "
https://jgalqq.sn.files.1drv.com/y4mM7ejJYUqZDr9eJve3Y4TQvLi5DrxCkakIpJjF-5Pt9HK28ZyGFI-AQN84Zh2K0pxbuOeVn2Sio-k0p23NpBBiGLI-we-m685AwG_ffxw18liTUgASyxTNnKStRB-d1BM-uTwMSJ6GbqTiGpY1ZnSydN-mjS4QAoJZNjs3PB4HOYyRTZRhCcIuc76VuZs0PZqG-C7iyYFHn4117DZqpgE2w"
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
