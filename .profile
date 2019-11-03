## Include custom bash variables
[[ -f "${HOME}/.bash_vars" ]] && source "${HOME}/.bash_vars"

# Include .bashrc if running bash
if [[ -n "${BASH_VERSION}" ]]; then
    if [[ -f "${HOME}/.bashrc" ]]; then
        source "${HOME}/.bashrc"
    fi
fi
