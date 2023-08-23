#!/bin/sh

# grep $(basename "$1") ~/.cache/lf_clean || lf -remote "send $ID redraw"
# basename "$1" > ~/.cache/lf_clean

[[ "$( basename "$1")" != "$(cat ~/.cache/LF_USER_F)" ]] && lf -remote "send $ID redraw"
basename "$1" > ~/.cache/LF_USER_F
