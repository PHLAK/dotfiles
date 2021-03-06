# System Command Aliases

alias cp='cp --interactive --recursive --verbose'
alias ls='ls --color=auto'
alias mkdir='mkdir --parents --verbose'
alias mv='mv --interactive --verbose'

alias rm='trash-put'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# Custom Aliases

alias artisan='php artisan'
alias clip='xclip -selection clipboard'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Command}}"'
alias dotfiles='git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}'
alias myip='dig -4 @resolver1.opendns.com myip.opendns.com +short'
alias speedtest='docker run -it --rm --net host phlak/speedtest'
alias ssh-copy-key='cat ${HOME}/.ssh/id_rsa.pub | tr -d "\n" | xclip -selection clipboard && echo "SSH public key coppied to clipboard"'
alias transfer='rsync -rzvvhP'
alias weather='curl -s wttr.in | sed -n "1,7p"; echo'

[[ $(command -v composer) ]] && alias composer="$(command -v composer)"
