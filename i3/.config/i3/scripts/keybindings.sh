#!/usr/bin/env bash

bindings="
Mod + Return                  Abrir Terminal (Alacritty)
Mod + Espacio                 Lanzador de aplicaciones (Rofi)
Mod + w                       Cerrar ventana enfocada
Mod + f                       Alternar pantalla completa (Fullscreen)
Mod + Shift + Espacio         Alternar flotante / mosaico
Mod + a                       Enfocar contenedor padre
Mod + Flechas                 Mover foco entre ventanas
Mod + Shift + Flechas         Mover ventana de posición
Mod + Shift + j / k / l / ñ   Mover ventana de posición (Vim / Alt)
Mod + h                       Dividir horizontalmente (Split h)
Mod + v                       Dividir verticalmente (Split v)
Mod + t                       Disposición en pestañas (Tabbed)
Mod + e                       Alternar modo división (Toggle split)
Mod + r                       Modo redimensionar (Resize)
Mod + [0-9]                   Cambiar a espacio de trabajo [0-9]
Mod + Shift + [0-9]           Mover ventana a espacio [0-9]
Mod + s                       Alternar Scratchpad (Toggle con blur)
Mod + Shift + s               Mover ventana a Scratchpad
Mod + l                       Bloquear pantalla (Betterlockscreen)
Mod + k                       Ver este menú de atajos
Mod + Shift + c               Recargar configuración de i3
Mod + Shift + r               Reiniciar i3
Ctrl + Alt + Supr             Menú de apagado (Powermenu)
XF86AudioRaiseVolume          Subir volumen (+10%)
XF86AudioLowerVolume          Bajar volumen (-10%)
XF86AudioMute                 Silenciar / activar sonido
XF86AudioMicMute              Silenciar / activar micrófono
"

echo "$bindings" | sed '/^[[:space:]]*$/d' | rofi -dmenu -i -p "Atajos" \
    -mesg "Escribe para filtrar o pulsa Escape para salir" \
    -font "monospace 11" \
    -theme-str '
        window {
            width: 750px;
            border: 2px;
            border-radius: 0px;
            padding: 12px;
        }
        element {
            border-radius: 0px;
            padding: 5px 10px;
        }
        element-text {
            font: "monospace 11";
        }
        listview {
            lines: 15;
            scrollbar: false;
        }
    '

