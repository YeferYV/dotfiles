#!/bin/sh

# # _auto_redraws:
# grep -q $(basename "$1") ~/.cache/lf_clean || lf -remote "send $ID redraw"
# basename "$1" > ~/.cache/lf_clean

# case $( xargs file --brief --mime-type "$1" ) in
#   text/*)     bat --color=always --theme=base16 "$1"     && exit 0;;
#   image/*)  ( chafa -f iterm -s "${2}x${3}" "$1" ) > CON && exit 1;;
#   *)          bat --color=always --theme=base16 "$1"     && exit 0;;
# esac

case "$1" in
  *.jpg|*.png|*.gif)  ( wezterm imgcat --width 50 "$1") > CON && exit 1;;
  *)                   bat --color=always --theme=base16 "$1" && exit 0;;
esac
