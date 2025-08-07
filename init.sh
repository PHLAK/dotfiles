#!/usr/bin/env bash

DOTFILES_PATH="${HOME}/.dotfiles"
if [[ -d ${DOTFILES_PATH} ]]; then
    echo ">>> ERROR: ${DOTFILES_PATH} already exists"
    exit 1
fi

git clone --bare https://github.com/PHLAK/dotfiles.git ${DOTFILES_PATH}

function dotfiles {
    git --git-dir=${DOTFILES_PATH} --work-tree=${HOME} $@
}

if [[ ! $(dotfiles checkout 2>/dev/null) ]]; then
    echo ">>> NOTICE: Backing up existing files"

    BACKUP_DIR="${HOME}/.dotfiles-backup/$(date +'%F_%T')"
    FILES="$(dotfiles checkout 2>&1 | grep -E '^\s+(.*)$' | awk {'print $1'})"

    for FILE in ${FILES}; do
        mkdir --parents "$(dirname ${BACKUP_DIR}/${FILE})" && mv "${HOME}/${FILE}" "$_"
    done

    dotfiles checkout 2>/dev/null
fi

dotfiles config status.showUntrackedFiles no
dotfiles remote set-url origin git@github.com:PHLAK/dotfiles.git
dotfiles update-index --assume-unchanged init.sh README.md

rm init.sh README.md

echo ">>> Dotfiles sucessfully installed!"

source ${HOME}/.bash_profile
