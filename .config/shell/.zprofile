#!/bin/env zsh

export CARGO_HOME="$HOME/.local/share/cargo"
export DOTFILES="$(dirname $(dirname $(realpath .zprofile)))"
export GIT_CONFIG_GLOBAL="$DOTFILES/shell/.gitconfig"
export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$HOME/.pixi/bin:$HOME/.local/bin" # required by wmenu
export ZATHURARC="$DOTFILES/zathura"
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix white screen on Java applications in window managers https://wiki.archlinux.org/title/Java#Gray_window,_applications_not_resizing_with_WM,_menus_immediately_closing

# export VISUAL="nvim"
# export ZDOTDIR="/home/drksl/.pixi/envs/wezterm/opt/retronvim/zsh"
# export TERAX_USER_ZDOTDIR="/home/drksl/.pixi/envs/wezterm/opt/retronvim/zsh"

# startup programs
[ -z "$WAYLAND_DISPLAY" ] && ~/.pixi/envs/retronvim/bin/kanata_touchcursor # requires disabling sudo password otherwise it will ask for password after login
[ -z "$WAYLAND_DISPLAY" ] && exec start-hyprland -- --config $DOTFILES/hypr/hyprland.conf

###############################################################################
# see https://bbs.archlinux.org/viewtopic.php?id=273011
# exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown
###############################################################################
