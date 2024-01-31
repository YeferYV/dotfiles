[[ -z $TMUX ]] && [[ -z $NVIM ]] && export PTS=$(tty)
source ~/.profile;
alias ls="exa --all --icons --group-directories-first";
set -o vi;
(xset r rate 210 70; xset b off) 2>/dev/null;
function vi() { $EDITOR $@; };
function y() { yazi --cwd-file=$HOME/.yazi $@; cd $(cat $HOME/.yazi); printf "\x1b[A\x1b[K"; };
function l() { cd "$(command lf -print-last-dir $@)"; printf "\x1b[A\x1b[K"; }
source ~/.nix-profile/share/fzf/key-bindings.bash;
source ~/.nix-profile/share/blesh/ble.sh;
ble-face -s auto_complete fg=238;
ble-face -s syntax_error fg=red;
ble-face -s command_builtin fg=green;
# ble-bind -m auto_complete -f M-l "vi_imap/normal-mode auto_complete/insert-on-end";
function ble/widget/normal_completion { ble/widget/auto_complete/insert; ble/widget/vi_imap/normal-mode; }
ble-bind -m auto_complete -f M-l normal_completion;
ble-bind -m vi_nmap --cursor 2;
ble-bind -m vi_imap --cursor 6;
bleopt exec_errexit_mark=;
function blerc/vim-load-hook { bleopt prompt_vi_mode_indicator= ; };
blehook/eval-after-load keymap_vi blerc/vim-load-hook;
eval "$(starship init bash)"
