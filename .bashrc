#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Made this because getting tmux working here exposed that this gets run multiple times: http://unix.stackexchange.com/questions/335703/virtual-console-agetty-tmux-seems-like-bashrc-is-getting-run-more-than-o/335706. No longer needed for that purpose, but no harm in leaving it in I think:
# ACTUALLY It needs to run again for tmux, which carries over exported variables but not stuff like aliases
# if [ -z "$local_bashrc_already_run" ]; then
#     export local_bashrc_already_run=1
# else
#     # echo "duplicate bashrc run" >> ~/test.log
#     return
# fi

export EDITOR=/usr/bin/vim

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=50000 # custom history length
export HISTFILESIZE=10000000 # custom history file size
shopt -s histappend # append to history, don't overwrite

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

[ -f "$HOME/.ripgreprc" ] && export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Aliases
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi

# Functions
if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi

# source ~/.git-completion.bash

# TODO/tobek removed when moving from trireme to tesselation, maybe install and put back?
#eval $(thefuck --alias)


# unused cause we're using bashish
# Custom bash prompt via kirsle.net/wizards/ps1.html
# export PS1="\[$(tput bold)\]\[$(tput setaf 7)\][\u@\h:\[$(tput setaf 3)\]\w\[$(tput setaf 7)\]]\\$ \[$(tput sgr0)\]"
# basic un-colored one:
# PS1='[\u@\h \w]\$ '


# tabtab source for packages
# uninstall by removing these lines
# TODO/tobek removed when moving from trireme to tesselation, maybe install and put back?
#[ -f ~/.config/tabtab/bash/__tabtab.bash ] && . ~/.config/tabtab/bash/__tabtab.bash || true


[ -f "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"
