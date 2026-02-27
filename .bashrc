# Don't do anything unless running interactively
[[ -z "${PS1}" ]] && return

# Include additional bash files
source "${HOME}/.bash_options"
source "${HOME}/.bash_path"
source "${HOME}/.bash_aliases"
source "${HOME}/.bash_functions"
[[ -f "${HOME}/.bash_local" ]] && source "${HOME}/.bash_local"
[[ -n "${ASCIINEMA_REC}" ]] && source "${HOME}/.asciinema_ps1" ||  source "${HOME}/.bash_ps1"

# Include programmable completion features
if ! shopt -oq posix; then
    if [[ -f "/usr/share/bash-completion/bash_completion" ]]; then
        source "/usr/share/bash-completion/bash_completion"
    elif [[ -f "/etc/bash_completion" ]]; then
        source "/etc/bash_completion"
    fi
fi

# Load local bash completion scripts
for file in ${HOME}/.bash_completion.d/*; do
    source ${file}
done

# Share bash command history with all open terminals
PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
