# If not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

# Set bash options
source "${HOME}/.bash_options"

# Load custom PS1
[[ -n "${ASCIINEMA_REC}" ]] && source "${HOME}/.asciinema_ps1" ||  source "${HOME}/.bash_ps1"

# Share bash command history with all open terminals
PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

# Include custom path definitions
source "${HOME}/.bash_path"

# Include custom bash functions
source "${HOME}/.bash_functions"

# Include custom bash aliases
source "${HOME}/.bash_aliases"

# Include programmable completion features
if ! shopt -oq posix; then
    if [[ -f "/usr/share/bash-completion/bash_completion" ]]; then
        source "/usr/share/bash-completion/bash_completion"
    elif [[ -f "/etc/bash_completion" ]]; then
        source "/etc/bash_completion"
    fi
fi

# Include custom bash completion
source "${HOME}/.bash_completion"

# Include bash secrets if present
[[ -f "${HOME}/.bash_secrets" ]] && source "${HOME}/.bash_secrets"

# Include local bash config if present
[[ -f "${HOME}/.bash_local" ]] && source "${HOME}/.bash_local"
