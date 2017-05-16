# Include .bashrc if running bash
if [[ -n "${BASH_VERSION}" ]]; then
    if [[ -f "${HOME}/.bashrc" ]]; then
        source "${HOME}/.bashrc"
    fi
fi

## Include custom bash variables
[[ -f "${HOME}/.bash_vars" ]] && source "${HOME}/.bash_vars"

# Add Composer bin to path if it exists
if [[ -d "${COMPOSER_HOME}/vendor/bin" ]]; then
    PATH="${COMPOSER_HOME}/vendor/bin:${PATH}"
fi

# Add Heroku bin to path if it exists
if [[ -d "/usr/local/heroku/bin" ]]; then
    PATH="/usr/local/heroku/bin:${PATH}"
fi

# Add local bin to the path if it exists
if [[ -d "${HOME}/.local/bin" ]]; then
    PATH="${HOME}/.local/bin:${PATH}"
fi

# Add user bin to path if it exists
if [[ -d "${HOME}/.bin" ]]; then
    PATH="${HOME}/.bin:${PATH}"
fi
