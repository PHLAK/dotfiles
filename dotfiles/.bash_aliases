alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias clip='xclip -selection clipboard'
alias ssh-copy-key='cat ${HOME}/.ssh/id_rsa.pub | tr -d "\n" | xclip -selection clipboard && echo "SSH public key coppied to clipboard"'
alias termbin='nc termbin.com 9999'
alias transfer='rsync -rzvvhP'
alias upaste='pastebinit -b http://paste.ubuntu.com'
alias weather='curl -s wttr.in | sed -n "1,7p"; echo'

alias artisan='php artisan'

alias phpunit='my_phpunit'

alias lastpass='lpass'

