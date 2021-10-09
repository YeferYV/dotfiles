#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
#export PULSE_SERVER=tcp:localhost

expot HOST_IP="$(ip route |awk '/^default/{print $3}')"
export PULSE_SERVER="tcp:$HOST_IP"r
