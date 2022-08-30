#!/bin/env zsh

# export PATH="$PATH:$HOME/.local/appimage:$HOME/.local/bin"
# export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"
# export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export PATH="$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':'):$HOME/.local/share/npm/bin:$PATH"

# unsetopt PROMPT_SP
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND='echo -ne "\033]0;$(TMP=${PWD/#$HOME/\~};echo ${TMP##*/})\007"'
export PS1="[\w]\$ "

#-- Default programs:
# export SHELL="$(which zsh)"
# export TERM="xterm-256color"
export EDITOR="nvim"
export VISUAL="nvim"
export OPENER="xdg-open"
export PAGER="less"
export TERMINAL="wezterm"
export BROWSER="google-chrome-stable"
export SURFRAW_text_browser='w3m -sixel'
export SURFRAW_graphical=no

#-- ~/Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
# export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/.xinitrc"
# export XSERVERRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/.xserverrc"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
# export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
# export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555"
# export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
# export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
# export DRI_PRIME=1 #Dedicated GPU as default
# export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
# export GPG_TTY=$(tty)
export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export IPYTHONDIR="${XDG_CONFIG_HOME:-$HOME/.config}/ipython"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export WEECHAT_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/weechat"
export CHTSH_CONF="${XDG_CONFIG_HOME:-$HOME/.config}/cht.sh/cht.sh.conf"
export NPM_CONFIG_PREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/npm"
export LESSKEYIN="${XDG_CONFIG_HOME:-$HOME/.config}/shell/lesskey"
export MPLAYER_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/mplayer"

#-- Other program settings:
export YT_API_KEY="AIzaSyDWLUg9KCJ6CAw2KXIsQTcOzMZRXOQ7OC0"
export DICS="/usr/share/stardict/dic/"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
export AWT_TOOLKIT="MToolkit wmname LG3D"	#May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm
export DEBIAN_FRONTEND=noninteractive
# export CACA_DRIVER=ncurses
# export FZF_DEFAULT_OPTS="--layout=reverse --height 40% --border"
export FZF_COMPLETION_TRIGGER=''

# export LESS="-R --use-color --LINE-NUMBERS --color=Nk" #causes manpages badformatting
export LESS='-RS'
export LESSOPEN="| /usr/bin/bat --style full --color always --paging always --wrap never %s"
# # export LESS_TERMCAP_so="$(printf '%b' '[01;43;30m')"                                # f: black b: yellow  # start standout (reversed)
# export LESS_TERMCAP_mb="$(printf '%b' '[1;34m')"                                      # f: blue             # start blinking
# export LESS_TERMCAP_md="$(printf '%b' '[1;32m')"                                      # f: green            # start bold
# export LESS_TERMCAP_me="$(printf '%b' '[0m')"                                         #                     # stop bold, blink and underline
# export LESS_TERMCAP_so="$(printf '%b' '[01;33m')"                                     # f: yellow           # start standout (reversed)
# export LESS_TERMCAP_se="$(printf '%b' '[0m')"                                         #                     # stop standout
# export LESS_TERMCAP_us="$(printf '%b' '[1;31m')"                                      # f: red              # start underline
# export LESS_TERMCAP_ue="$(printf '%b' '[0m')"                                         #                     # stop underline
# # export LESS_TERMCAP_so=$(tput -T ansi smso; tput -T ansi rev ; tput -T ansi setaf 3)  # f: black b: yellow  # start standout (reversed)
export LESS_TERMCAP_mb=$(tput -T ansi blink)                                              #                     # start blinking
export LESS_TERMCAP_md=$(tput -T ansi bold; tput -T ansi setaf 2)                         # f: green            # start bold
export LESS_TERMCAP_me=$(tput -T ansi sgr0)                                               #                     # stop bold, blink and underline
export LESS_TERMCAP_so=$(tput -T ansi smso; tput -T ansi setaf 0; tput -T ansi setab 3)   # f: black b: yellow  # start standout (reversed)
export LESS_TERMCAP_se=$(tput -T ansi rmso)                                               #                     # stop standout
export LESS_TERMCAP_us=$(tput -T ansi smul; tput -T ansi setaf 1)                         # f: red              # start underline
export LESS_TERMCAP_ue=$(tput -T ansi rmul)                                               #                     # stop underline

export SPACESHIP_EXEC_TIME_SHOW="false"
export SPACESHIP_PROMPT_ADD_NEWLINE="false"
export SPACESHIP_PROMPT_SEPARATE_LINE="false"
export SPACESHIP_DIR_COLOR="#555555"
export SPACESHIP_DIR_TRUNC=9
#export SPACESHIP_CHAR_SYMBOL=❯
export SPACESHIP_CHAR_SYMBOL=ﲵ
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_HG_SHOW="false"
export SPACESHIP_PACKAGE_SHOW="false"
export SPACESHIP_NODE_SHOW="false"
export SPACESHIP_RUBY_SHOW="false"
export SPACESHIP_ELM_SHOW="false"
export SPACESHIP_ELIXIR_SHOW="false"
export SPACESHIP_XCODE_SHOW_LOCAL="false"
export SPACESHIP_SWIFT_SHOW_LOCAL="false"
export SPACESHIP_GOLANG_SHOW="false"
export SPACESHIP_PHP_SHOW="false"
export SPACESHIP_RUST_SHOW="false"
export SPACESHIP_JULIA_SHOW="false"
export SPACESHIP_DOCKER_SHOW="false"
export SPACESHIP_DOCKER_CONTEXT_SHOW="false"
export SPACESHIP_AWS_SHOW="false"
export SPACESHIP_CONDA_SHOW="false"
export SPACESHIP_VENV_SHOW="false"
export SPACESHIP_PYENV_SHOW="false"
export SPACESHIP_DOTNET_SHOW="false"
export SPACESHIP_EMBER_SHOW="false"
export SPACESHIP_KUBECONTEXT_SHOW="false"
export SPACESHIP_TERRAFORM_SHOW="false"
export SPACESHIP_TERRAFORM_SHOW="false"
export SPACESHIP_VI_MODE_SHOW="false"
export SPACESHIP_JOBS_SHOW="false"

export LS_COLORS="\
tw=90:\ #black
or=91:\ #red
ex=92:\ #green
bd=93:\ #yellow
di=94:\ #blue
ow=95:\ #magenta
ln=96:\ #cyan
fi=97"  #white

export LF_ICONS="\
tw=:\
or=:\
ex=:\
bd=:\
di=:\
ow=:\
ln=:\
fi="

# #-- Switch escape and caps if tty and no passwd required:
# sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/larbs/ttymaps.kmap 2>/dev/null
# [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && shortcuts >/dev/null 2>&1 &

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"; fi # added by brew.sh installer

# Start graphical server on user's current tty if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"

