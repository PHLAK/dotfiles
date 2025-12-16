# ----------------------------------------
# Dotfiles helper
# ----------------------------------------

alias dotfiles='git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}'

# ----------------------------------------
# System Command Aliases
# ----------------------------------------

alias cp='cp --interactive --recursive --verbose'
alias ip='ip --color=auto'
alias ls='ls --color=auto'
alias mkdir='mkdir --parents --verbose'
alias mv='mv --interactive --verbose'
alias rm='trash-put'

alias diff='colordiff'

alias grep='grep --color=auto'

# ----------------------------------------
# Custom Aliases
# ----------------------------------------

alias artisan='php artisan'
alias clip='xclip -selection clipboard'
alias dcr='docker compose run --rm'
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias profile='/usr/bin/time --verbose'
alias rebuild='paru --sync --rebuild'
alias transfer='rsync -rzvvhP'
alias weather='curl -s wttr.in | sed -n "1,7p"; echo'

[[ $(command -v composer) ]] && alias composer="$(command -v composer)"
