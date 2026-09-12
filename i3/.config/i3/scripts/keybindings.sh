#!/usr/bin/env bash

bindings="
Mod + Return        Abrir Terminal (Alacritty)
Mod + d             Lanzador de aplicaciones (Rofi)
Mod + k             Ver esta lista de atajos
Mod + Shift + q     Cerrar ventana actual
Mod + Shift + r     Recargar configuración de i3
Mod + Shift + e     Salir de i3 (Cerrar sesión)
Mod + f             Pantalla completa (Fullscreen)
Mod + Shift + Space Alternar flotante / tiled
Mod + Flechas/hjkl  Mover foco entre ventanas
Mod + Shift + Flech Mover ventana de posición
Mod + [1-9]         Cambiar al espacio de trabajo [1-9]
Mod + Shift + [1-9] Mover ventana al espacio [1-9]
"

# Lanzar Rofi en modo menú interactivo con buscador
echo "$bindings" | sed '/^[[:space:]]*$/d' | rofi -dmenu -i -p "Atajos" -mesg "Escribe para filtrar o pulsa Escape para salir"
