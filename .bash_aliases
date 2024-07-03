# System Command Aliases

alias cp='cp --interactive --recursive --verbose'
alias ip='ip --color=auto'
alias ls='ls --color=auto'
alias mkdir='mkdir --parents --verbose'
alias mv='mv --interactive --verbose'
alias rm='trash-put'

alias diff='colordiff'

alias grep='grep --color=auto'

# Custom Aliases

alias artisan='php artisan'
alias clip='xclip -selection clipboard'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Command}}"'
alias dotfiles='git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}'
alias profile='/usr/bin/time --verbose'
alias rebuild='paru --sync --rebuild'
alias speedtest='docker run -it --rm --net host phlak/speedtest'
alias transfer='rsync -rzvvhP'
alias weather='curl -s wttr.in | sed -n "1,7p"; echo'

[[ $(command -v composer) ]] && alias composer="$(command -v composer)"
