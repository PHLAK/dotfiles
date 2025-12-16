# Include custom bash variables & secrets if present
[[ -f "${HOME}/.bash_vars" ]] && source "${HOME}/.bash_vars"
[[ -f "${HOME}/.bash_secrets" ]] && source "${HOME}/.bash_secrets"

# Include .bashrc when running bash
[[ -n "${BASH_VERSION}" ]] && source "${HOME}/.bashrc"
