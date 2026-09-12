#!/usr/bin/env bash

bindings="
Mod + Return        Abrir Terminal (Alacritty)
Mod + Espacio       Lanzador de aplicaciones (Rofi)
Mod + l             Bloquear pantalla (Betterlockscreen)
Mod + k             Ver esta lista de atajos
Mod + w             Cerrar ventana actual
Mod + Shift + r     Reiniciar i3
Mod + Shift + c     Recargar configuración de i3
Mod + Shift + e     Menú de apagado (Powermenu)
Mod + f             Pantalla completa (Fullscreen)
Mod + Shift + Space Alternar flotante / mosaico
Mod + Flechas       Mover foco entre ventanas
Mod + Shift + Flech Mover ventana de posición
Mod + h / Mod + v   División horizontal / vertical
Mod + [0-9]         Cambiar al espacio de trabajo [0-9]
Mod + Shift + [0-9] Mover ventana al espacio [0-9]
"

# Lanzar Rofi en modo menú interactivo con buscador
echo "$bindings" | sed '/^[[:space:]]*$/d' | rofi -dmenu -i -p "Atajos" -mesg "Escribe para filtrar o pulsa Escape para salir"
