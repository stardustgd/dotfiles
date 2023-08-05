# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vim='nvim'
PS1='[\u@\h \W]\$ '

export SCRIPT_DIR=/home/basti/.config/scripts

exec zsh
bind 'set completion-ignore-case on'
