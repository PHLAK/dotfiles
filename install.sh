#!/bin/bash

## Get the script's path
script_path="$(dirname $(readlink -f ${0}))"

## Array of dot files
dotfiles=$(ls -A ${script_path}/dotfiles)

## Get current date/time
now="$(date +%F_%T)"

## Create the backup dir if non-existent
if [[ ! -d "${script_path}/backups" ]]; then
    mkdir -p ${script_path}/backups
fi

for file in ${dotfiles}; do

    ## Set live file path
    live_path="${HOME}/${file}"

    ## Backup existing files
    if [[ -e "${live_path}" ]]; then
        if [[ ! -h "${live_path}" ]]; then
            mv ${live_path} ${script_path}/backups/${file}.${now}.bak
        fi
    fi

    ##
    if [[ ! -h "${live_path}" ]]; then
        ln -s ${script_path}/dotfiles/${file} ${live_path}
    fi

done

## Create ~/bin if it doesn't exist
if [[ ! -d "${HOME}/bin" ]]; then
    mkdir -p "${HOME}/bin"
fi

## Create symlink to soxy bin
if [[ ! -e "${HOME}/bin/soxy" ]]; then
    if [[ -e "${HOME}/.scripts/soxy/soxy" ]]; then
        ln -s ${HOME}/.scripts/soxy/soxy ${HOME}/bin/soxy
    fi
fi

## Create symlink to git-stree bin
if [[ ! -e "${HOME}/bin/git-stree" ]]; then
    if [[ -e "${HOME}/.scripts/git-stree/git-stree"]]; then
        ln -s ${HOME}/.scripts/git-stree/git-stree ${HOME}/bin/git-stree
    fi
fi
