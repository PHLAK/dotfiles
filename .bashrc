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

## Include custom PS1
if [[ ${ASCIINEMA_REC} ]]; then
    [[ -f "${HOME}/.asciinema_ps1" ]] && source "${HOME}/.asciinema_ps1"
else
    [[ -f "${HOME}/.bash_ps1" ]] && source "${HOME}/.bash_ps1"
fi

## Include custom path definitions
[[ -f "${HOME}/.bash_path" ]] && source "${HOME}/.bash_path"

## Include custom bash functions
[[ -f "${HOME}/.bash_functions" ]] && source "${HOME}/.bash_functions"

## Include custom bash aliases
[[ -f "${HOME}/.bash_aliases" ]] && source "${HOME}/.bash_aliases"

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

## Include local bash config
[[ -f "${HOME}/.bash_local" ]] && source "${HOME}/.bash_local"
