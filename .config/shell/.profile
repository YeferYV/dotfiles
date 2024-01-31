#!/bin/bash

# export DISPLAY=:0 # conflicts with gnome
export BAT_THEME="base16"
export BROWSER="google-chrome"
export EDITOR="nvim"
export DRAG_ON_DROP="xdragon"
export EXA_COLORS="reset:uu=0:ur=0:uw=0:ux=0:ue=0:gu=0:gr=0:gw=0:gx=0:tr=0:tw=0:tx=0:da=0:sn=0:di=34"
export HISTFILE="$HOME/.cache/history"
export LANG=en_US.UTF-8
export LF_ICONS=" tw=󰉋:or=:ex=:bd=:di=󰉋:ow=󰉋:ln=:fi="
export LS_COLORS="tw=30:or=31:ex=32:bd=33:di=34:ow=35:ln=36:fi=37"
export OPENER="gio open"
export PAGER="less -r --use-color -Dd+r -Du+b -DPyk -DSyk"
export PATH="$HOME/.local/bin:$HOME/.local/share/sixelrice:$HOME/.local/share/npm/bin:$PATH"
export PROMPT_COMMAND='printf   "\033]0; $(basename ${PWD/~/\~}) \a" '
export SAVEHIST=1000000
export SHELL="$(which bash)"
export SWALLOWER="devour"
export TERM="xterm-256color"
export TERM_PROGRAM=${TERM_PROGRAM:-WezTerm} # for yazi-image-preview inside docker
export TERMINAL="wezterm"
export VISUAL="nvim"

#-- Clean-up:
# export LOCALE_ARCHIVE="/lib/locale/locale-archive" # nix locale
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export DEBIAN_FRONTEND=noninteractive
export FZF_DEFAULT_OPTS="--multi --color='hl:#cccc00,hl+:#cccc00'"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export LESSKEYIN="${XDG_CONFIG_HOME:-$HOME/.config}/shell/lesskey"
export NPM_CONFIG_PREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/npm"
export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export STARSHIP_CONFIG="$HOME/.config/shell/starship.toml"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

if [ -e /.dockerenv ]; then
  export APPIMAGE_EXTRACT_AND_RUN=1
  alias mpv="XDG_RUNTIME_DIR=/run/user/1000 mpv"
  sudo chown $USER:$USER /run/user/1000
  [ -e /bin/sshd ] && sudo ssh-keygen -A && sudo /bin/sshd
fi

# Start graphical server on user's current tty if not already running.
# [ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
