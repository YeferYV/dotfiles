#!/bin/bash

## env
# . $HOME/.config/shell/.zprofile

## enable docker/root's nvim clipboard
# xhost +

## disable annoying beep
xset b off

## music player daemon
which mpd 2>/dev/null && mpd --verbose &
# mpDris2 &

## audio daemon (for arch)
# pipewire-pulse &

## simple hotkey daemon
bash --login -c "sleep 7 && sxhkd" &

## screen temperature
bash --login -c "sleep 7 && redshift -O 4444" &

## touchcursor-like + xcapes-like remaps
[ -e ~/.nix-profile/bin/kanata ] && sudo ~/.nix-profile/bin/kanata --cfg ~/.config/kanata/simple.kbd &

## Remove mouse when idle
# unclutter --timeout 1 &

## Load a resource file, and merge with the current settings (for urxvt)
# xrdb -merge ~/.config/x11/xresources &
bash -c 'sleep 7 && xrdb -merge <<<"*foreground: #ff0000" && xrdb -merge <<<"*background: #000000"' & # sxiv fg/bg # locale-gen (if "no locale support")
bash -c 'sleep 7 && xrdb -merge <<<"Xcursor.theme: Adwaita"' & # wezterm cursor

## To Load pointer
# xsetroot -cursor_name left_ptr &

## Set Wallpaper
# hsetroot -solid "#080808" &
# ( wal -R && gio trash "$HOME"/.cache/wal/wezterm-wal.toml ) || wal --cols16 -s -i "$HOME/.local/share/bg" -o $HOME/.config/wal/postrun
# picom &

## vncserver
# x0vncserver -rfbauth ~/.vnc/passwd &

###############################################################################
# # see https://unix.stackexchange.com/a/295652/332452
# source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
#
# # see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
# eval $(/usr/bin/gnome-keyring-daemon --start)
# export SSH_AUTH_SOCK
#
# # see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
# mkdir -p "$HOME"/.local/share/keyrings
###############################################################################

##############################################################################
# # see https://github.com/microsoft/vscode/issues/120392#issuecomment-814210643
# # init keyring
# eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# # export keyring
# export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
# exec dbus-launch bspwm
###############################################################################

###############################################################################
# see https://bbs.archlinux.org/viewtopic.php?id=273011
# exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown
###############################################################################

## window-manager (exec for logout)
# exec i3
# exec dwm
# exec bspwm
which awesome 2>/dev/null && exec awesome
