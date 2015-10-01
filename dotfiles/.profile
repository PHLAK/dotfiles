# Include .bashrc if running bash
if [[ -n "${BASH_VERSION}" ]]; then
    if [[ -f "${HOME}/.bashrc" ]]; then
        source "${HOME}/.bashrc"
    fi
fi

# Add Composer bin to path if it exists
if [[ -d "${HOME}/.composer/vendor/bin" ]]; then
    PATH="${HOME}/.composer/vendor/bin:${PATH}"
fi

# Add user bin to path if it exists
if [[ -d "${HOME}/bin" ]]; then
    PATH="${HOME}/bin:${PATH}"
fi
