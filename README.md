# Dotfiles - Configuración de i3wm

> Documentación para migrar esta configuración a otra distro o máquina.

---

## Tabla de Contenidos

- [Requisitos](#requisitos)
- [Estructura de Archivos](#estructura-de-archivos)
- [Instalación](#instalación)
- [Dependencias por Distro](#dependencias-por-distro)
- [Configuración Post-Instalación](#configuración-post-instalación)
- [Atajos de Teclado](#atajos-de-teclado)
- [Notas Adicionales](#notas-adicionales)

---

## Requisitos

### Programas Obligatorios

| Programa | Descripción | Uso |
|----------|-------------|-----|
| `i3` | Window manager | Gestor de ventanas principal |
| `i3status` | Barra de estado | Muestra info del sistema en la barra |
| `i3bar` | Barra de i3 | Viene incluido con i3 |
| `alacritty` | Terminal | Emulador de terminal por defecto |
| `rofi` | Lanzador | Menú de aplicaciones y menús personalizados |
| `feh` | Wallpaper | Establecer fondo de pantalla |
| `betterlockscreen` | Bloqueo | Bloqueo de pantalla con blur |
| `xss-lock` | Bloqueo automático | Bloquea al suspender |
| `dex` | Autostart | Ejecuta archivos .desktop de XDG Autostart |
| `autotiling` | Auto-tiling | Alterna split horizontal/vertical automáticamente |
| `xrandr` | Pantalla | Configura resolución y refresh rate |
| `pactl` | Audio | Control de volumen (PulseAudio) |
| `nm-applet` | Red | Applet de NetworkManager para la bandeja del sistema |
| `jq` | JSON | Procesamiento JSON en scripts (scratchpad-toggle) |
| `i3lock-color` | Bloqueo | Motor de bloqueo (requerido por betterlockscreen) |

### Fuentes Necesarias

| Fuente | Uso |
|--------|-----|
| `monospace` | Fuente general (i3, rofi, keybindings) |
| `Sans` | Fuente alternativa en rofi |

> **Nota:** En la mayoría de distros, `monospace` y `Sans` están disponibles por defecto o se instalan con paquetes como `fonts-dejavu` o `fonts-liberation`.

---

## Estructura de Archivos

```
dotfiles/
├── i3/
│   └── .config/
│       └── i3/
│           ├── config              # Configuración principal de i3
│           └── scripts/
│               └── keybindings.sh  # Menú de atajos (cheatsheet)
├── i3status/
│   └── .config/
│       └── i3status/
│           └── config              # Configuración de la barra de estado
└── README.md                       # Este archivo

# Archivos en ~/.local/bin/ (no están en dotfiles, hay que copiarlos aparte)
.local/bin/
├── powermenu.sh          # Menú de apagado/reinicio/suspensión
├── scratchpad-toggle.sh  # Toggle de scratchpad con cambio de wallpaper
├── i3bar-click.py        # Script para clics en la barra
├── i3lock                # Wrapper de i3lock-color
└── keybindings.sh -> .config/i3/scripts/keybindings.sh  (symlink)
```

---

## Instalación

### 1. Clonar o copiar los dotfiles

```bash
# Si usas git
git clone <tu-repo> ~/dotfiles

# O copiar manualmente
cp -r dotfiles ~/dotfiles
```

### 2. Crear los symlinks

```bash
# Configuración de i3
ln -sf ~/dotfiles/i3/.config/i3 ~/.config/i3

# Configuración de i3status
ln -sf ~/dotfiles/i3status/.config/i3status ~/.config/i3status

# Scripts en ~/.local/bin/
ln -sf ~/.config/i3/scripts/keybindings.sh ~/.local/bin/keybindings.sh
```

### 3. Restaurar archivos extras (zip de Documentos)

Los archivos que **no** están en este repo (scripts de `~/.local/bin/` y configuración PAM) están comprimidos en:

```
~/Documentos/dotfiles-extras.zip
```

Para restaurarlos:

```bash
# Descomprimir los scripts en ~/.local/bin/
unzip ~/Documentos/dotfiles-extras.zip -d ~/.local/bin/

# Dar permisos de ejecución
chmod +x ~/.local/bin/*.sh ~/.local/bin/*.py ~/.local/bin/i3lock

# Restaurar configuración PAM (requiere sudo)
sudo mkdir -p /etc/pam.d
sudo cp ~/.local/bin/i3lock /etc/pam.d/i3lock
```

> **Nota:** El zip contiene los archivos aplanados (sin estructura de carpetas). Al descomprimir en `~/.local/bin/`, los scripts quedan directamente ahí. El archivo `i3lock` del zip es la configuración de PAM, no el binario.

### 4. Copiar el wallpaper

```bash
# El wallpaper principal está referenciado en:
# ~/.config/i3/config -> exec_always --no-startup-id feh --bg-fill /home/jacka/Imágenes/bosc.jpg
# Asegúrate de que exista en esa ruta o cambia la ruta en el config
```

---

## Dependencias por Distro

### Arch Linux / Manjaro

```bash
sudo pacman -S --needed \
    i3-wm i3status i3lock-color \
    alacritty \
    rofi \
    feh \
    betterlockscreen \
    xss-lock \
    dex \
    autotiling \
    xorg-xrandr \
    pulseaudio \
    network-manager-applet \
    jq \
    ttf-dejavu ttf-liberation
```

### Debian / Ubuntu / Linux Mint

```bash
sudo apt install --no-install-recommends \
    i3-wm i3status i3lock-color \
    alacritty \
    rofi \
    feh \
    xss-lock \
    dex \
    x11-xserver-utils \
    pulseaudio-utils \
    network-manager-gnome \
    jq \
    fonts-dejavu fonts-liberation

# betterlockscreen y autotiling no están en los repos oficiales
# Instalar manualmente (ver abajo)
```

### Fedora

```bash
sudo dnf install \
    i3 i3status i3lock-color \
    alacritty \
    rofi \
    feh \
    xss-lock \
    dex \
    xrandr \
    pulseaudio-utils \
    NetworkManager-applet \
    jq \
    dejavu-sans-fonts liberation-fonts
```

### openSUSE

```bash
sudo zypper install \
    i3 i3status i3lock-color \
    alacritty \
    rofi \
    feh \
    xss-lock \
    dex \
    xrandr \
    pulseaudio-utils \
    NetworkManager-applet \
    jq \
    dejavu-fonts liberation-fonts
```

---

## Configuración Post-Instalación

### betterlockscreen

No está en los repos de todas las distras. Instalación manual:

```bash
# Opción 1: Desde AUR (Arch)
yay -S betterlockscreen

# Opción 2: Instalación manual
git clone https://github.com/betterlockscreen/betterlockscreen.git /tmp/betterlockscreen
cd /tmp/betterlockscreen
sudo cp betterlockscreen /usr/local/bin/
sudo chmod +x /usr/local/bin/betterlockscreen
sudo cp system/betterlockscreen@.service /usr/lib/systemd/system/
```

### autotiling

```bash
# Opción 1: Desde AUR (Arch)
yay -S autotiling

# Opción 2: Instalación manual
git clone https://github.com/nwg-piotr/autotiling.git /tmp/autotiling
cd /tmp/autotiling
sudo cp autotiling.py /usr/local/bin/autotiling
sudo chmod +x /usr/local/bin/autotiling
```

### dex (XDG Autostart)

```bash
# Arch
sudo pacman -S dex

# Debian/Ubuntu
sudo apt install dex

# Si no está disponible, puedes comentar la línea en el config:
# exec --no-startup-id dex --autostart --environment i3
```

### i3lock-color

```bash
# Arch (AUR)
yay -S i3lock-color

# Debian/Ubuntu
sudo apt install i3lock-color

# Si no está disponible, instalar i3lock normal y ajustar betterlockscreen
```

### Configurar PAM para i3lock

```bash
# Copiar la configuración de PAM
sudo cp ~/.config/pam.d/i3lock /etc/pam.d/i3lock
```

### NetworkManager

Asegúrate de que NetworkManager esté activo:

```bash
sudo systemctl enable --now NetworkManager
```

### PulseAudio

```bash
# Asegúrate de que PulseAudio esté activo
pulseaudio --start
# O con systemd --user
systemctl --user enable --now pulseaudio
```

---

## Atajos de Teclado

> **Mod** = Tecla Windows/Super (Mod4)

| Atajo | Acción |
|-------|--------|
| `Mod + Return` | Abrir terminal (Alacritty) |
| `Mod + Espacio` | Lanzador de aplicaciones (Rofi) |
| `Mod + w` | Cerrar ventana enfocada |
| `Mod + f` | Alternar pantalla completa |
| `Mod + Shift + Espacio` | Alternar flotante / mosaico |
| `Mod + a` | Enfocar contenedor padre |
| `Mod + Flechas` | Mover foco entre ventanas |
| `Mod + Shift + Flechas` | Mover ventana de posición |
| `Mod + h` | Dividir horizontalmente |
| `Mod + v` | Dividir verticalmente |
| `Mod + t` | Disposición en pestañas |
| `Mod + e` | Alternar modo división |
| `Mod + r` | Modo redimensionar |
| `Mod + [0-9]` | Cambiar a espacio de trabajo |
| `Mod + Shift + [0-9]` | Mover ventana a espacio de trabajo |
| `Mod + s` | Alternar Scratchpad (con blur) |
| `Mod + Shift + s` | Mover ventana a Scratchpad |
| `Mod + l` | Bloquear pantalla |
| `Mod + k` | Ver menú de atajos |
| `Mod + Shift + c` | Recargar configuración de i3 |
| `Mod + Shift + r` | Reiniciar i3 |
| `Ctrl + Alt + Supr` | Menú de apagado |
| `XF86AudioRaiseVolume` | Subir volumen (+10%) |
| `XF86AudioLowerVolume` | Bajar volumen (-10%) |
| `XF86AudioMute` | Silenciar / activar sonido |
| `XF86AudioMicMute` | Silenciar / activar micrófono |

---

## Notas Adicionales

### Pantalla / Monitor

El config tiene una línea que fuerza 144Hz en el puerto DP-1:

```bash
exec_always --no-startup-id xrandr --output DP-1 --mode 1920x1080 --rate 143.85
```

> **IMPORTANTE:** Cambia `DP-1` por el nombre de tu salida de video y ajusta la resolución/refresh rate según tu monitor. Para ver tus salidas disponibles: `xrandr --query`

### Wallpaper

El wallpaper está configurado en:
```bash
exec_always --no-startup-id feh --bg-fill /home/jacka/Imágenes/bosc.jpg
```

Cambia esta ruta al migrar. El script `scratchpad-toggle.sh` también referencia:
```bash
WALLPAPER_ORIGINAL="$HOME/.config/i3/wallpaper.jpg"
```

### Colores (Tema Catppuccin Mocha)

La configuración usa la paleta de colores **Catppuccin Mocha**:

| Color | Hex |
|-------|-----|
| Background | `#1e1e2e` |
| Text | `#cdd6f4` |
| Separator | `#585b70` |
| Focused workspace | `#89b4fa` |
| Active workspace | `#313244` |
| Inactive workspace | `#1e1e2e` |
| Urgent workspace | `#f38ba8` |
| Good (i3status) | `#a6e3a1` |
| Degraded (i3status) | `#f9e2af` |
| Bad (i3status) | `#f38ba8` |

### Scratchpad con Blur

El script `scratchpad-toggle.sh` cambia el wallpaper al fondo difuminado de betterlockscreen cuando entras al workspace "scratch", y lo restaura al salir. Esto requiere que betterlockscreen haya generado previamente el blur:

```bash
# Generar el blur manualmente (la primera vez)
betterlockscreen -u ~/Imágenes/bosc.jpg --blur 0.5
```

### i3bar-click.py

Script para manejar clics en la barra de i3. Si no lo usas, puedes ignorarlo.

---

## Resumen de Migración Rápida

1. **Instalar dependencias** (ver sección por distro)
2. **Copiar dotfiles** y crear symlinks
3. **Copiar scripts** de `~/.local/bin/`
4. **Ajustar rutas** (wallpaper, monitor)
5. **Configurar PAM** para i3lock
6. **Activar servicios** (NetworkManager, PulseAudio)
7. **Generar blur** inicial con betterlockscreen
8. **Cerrar sesión** y entrar con i3

---

*Última actualización: Septiembre 2026*
