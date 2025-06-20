#!/usr/bin/env bash

# Mata instancias previas de polybar
killall -q polybar

# Espera que termine de cerrarse
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanza polybar (ajusta el nombre si tu config usa otro bar)
polybar main &


