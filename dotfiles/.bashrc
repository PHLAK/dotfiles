## If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

## Don't allow duplicate lines in the history
HISTCONTROL=ignoreboth

## Append to the history file, don't overwrite it
shopt -s histappend

## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2048
HISTFILESIZE=8192

## Share bash command history with all open terminals
PROMPT_COMMAND="history -a; history -n"

## Update the values of LINES and COLUMNS after each command if windows size changes
shopt -s checkwinsize

## Make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

## Set hostname color (for PS1)
if [[ -n "$SSH_CLIENT" ]]; then
    export HOST_COLOR=31m
else
    export HOST_COLOR=34m
fi

## Show git dirty state (for PS1)
export GIT_PS1_SHOWDIRTYSTATE=1

## Set custom bash prompt
export PS1='\[\033[01;32m\]\u\[\033[01;30m\]@\[\033[01;${HOST_COLOR}\]\h\[\033[01;35m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;30m\] \$\[\033[00m\] '

## Include custom bash functions
if [[ -f ~/.bash_functions ]]; then
    . ~/.bash_functions
fi

## Include custom bash aliases
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

## Include local bash config
if [[ -f ~/.bash_local ]]; then
    . ~/.bash_local
fi

## Include programmable completion features
if ! shopt -oq posix; then
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        . /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        . /etc/bash_completion
  fi
fi

## Add ~/bin to the PATH variable
export PATH=${PATH}:~/bin
