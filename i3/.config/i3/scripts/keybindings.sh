#!/usr/bin/env bash

clear

cat << "EOF"
╭──────────────────────────────────────────────────────────╮
│                   ATAJOS DE TECLADO (i3)                 │
╰──────────────────────────────────────────────────────────╯

  APLICACIONES
  ──────────────────────────────────────────────────────────
  Mod + Enter           Abrir terminal (Alacritty)
  Mod + d               Lanzador de programas (Rofi)
  Mod + b               Abrir navegador web

  GESTIÓN DE VENTANAS
  ──────────────────────────────────────────────────────────
  Mod + Shift + q       Cerrar ventana enfocada
  Mod + f               Pantalla completa (on/off)
  Mod + Shift + Espacio Alternar ventana flotante / fija
  Mod + Flechas         Cambiar foco entre ventanas
  Mod + Shift + Flechas Mover ventana de sitio

  ESPACIOS DE TRABAJO
  ──────────────────────────────────────────────────────────
  Mod + 1 .. 9          Cambiar al escritorio 1 al 9
  Mod + Shift + 1 .. 9  Mover ventana al escritorio 1 al 9

  SISTEMA Y CONTROL
  ──────────────────────────────────────────────────────────
  Mod + Shift + r       Reiniciar i3 (aplica cambios del rice)
  Mod + k               Mostrar esta ventana de ayuda
  Mod + l               Bloquear pantalla
  Mod + Shift + e       Menú de apagado / cerrar sesión

────────────────────────────────────────────────────────────
          Presiona cualquier tecla para cerrar...
EOF

read -n 1 -s -r
