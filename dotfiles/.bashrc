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
[[ -x "/usr/bin/lesspipe" ]] && eval "$(SHELL=/bin/sh lesspipe)"

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
[[ -f "${HOME}/.bash_functions" ]] && source "${HOME}/.bash_functions"

## Include custom bash aliases
[[ -f "${HOME}/.bash_aliases" ]] && source "${HOME}/.bash_aliases"

## Include local bash config
[[ -f "${HOME}/.bash_local" ]] && source "${HOME}/.bash_local"

## Include programmable completion features
if ! shopt -oq posix; then
    if [[ -f "/usr/share/bash-completion/bash_completion" ]]; then
        source "/usr/share/bash-completion/bash_completion"
    elif [[ -f "/etc/bash_completion" ]]; then
        source "/etc/bash_completion"
  fi
fi

# Include custom bash completion
[[ -f "${HOME}/.bash_completion" ]] && source "${HOME}/.bash_completion"
