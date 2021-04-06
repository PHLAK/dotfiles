# Include custom bash variables
source "${HOME}/.bash_vars"

# Include .bashrc if running bash
if [[ -n "${BASH_VERSION}" ]]; then
    source "${HOME}/.bashrc"
fi
