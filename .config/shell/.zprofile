#!/bin/env zsh

export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export DOTFILES="$(dirname $(dirname $(realpath .zprofile)))"
export GIT_CONFIG_GLOBAL="$DOTFILES/shell/.gitconfig"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export MPV_HOME="$DOTFILES/mpv"
export NPM_CONFIG_PREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/npm"
export PATH="$HOME/.pixi/bin:$HOME/.local/share/pnpm:$HOME/.local/share/npm/bin:$HOME/.local/bin:$HOME/.console-ninja/.bin:$PATH"
export RETRONVIM_PATH=$(print -l $HOME/.vscode/extensions/yeferyv.retronvim* | head -n1)
export VISUAL="nvim"
export WEZTERM_CONFIG_FILE="$DOTFILES/_gitmodules/retronvim/zsh/wezterm.lua"
export ZATHURARC="$DOTFILES/zathura"
export ZDOTDIR="$DOTFILES/_gitmodules/retronvim/zsh"
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix white screen on Java applications in window managers https://wiki.archlinux.org/title/Java#Gray_window,_applications_not_resizing_with_WM,_menus_immediately_closing

# startup programs
$DOTFILES/shell/battery &
sudo $RETRONVIM_PATH/bin/env/bin/kanata --cfg $DOTFILES/_gitmodules/retronvim/kanata/simple.kbd &
mpd $DOTFILES/mpd/mpd.conf &
[ -z "$WAYLAND_DISPLAY" ] && exec hyprland --config $DOTFILES/hypr/hyprland.conf

###############################################################################
# see https://bbs.archlinux.org/viewtopic.php?id=273011
# exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown
###############################################################################
