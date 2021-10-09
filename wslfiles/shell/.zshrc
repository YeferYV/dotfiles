
set -o vi
autoload -U promptinit; promptinit
prompt spaceship

export EDITOR='nvim'
export VISUAL='bat'
export HOST_IP="$(ip route |awk '/^default/{print $3}')"
export PULSE_SERVER="tcp:$HOST_IP"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/lf-git/lfcd.sh

bindkey -s '\eo' 'lfcd\n'

