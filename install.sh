#!/bin/bash

## Array of dot files
dotfiles=$(ls -A dotfiles)

## Get the script's path
script_path=$(dirname $(readlink -f $0))

## Get current date/time
now=$(date +%F_%T)

## Create the backup dir
mkdir -p $script_path/backups/$now/

## Backup all of the things
for file in $dotfiles; do
    if [[ -e ~/$file ]]; then
        mv ~/$file $script_path/backups/$now/
    fi
done

## Symlink all of the things
for file in $dotfiles; do
    if [[ ! -e ~/$file ]]; then
        ln -s $script_path/dotfiles/$file ~/$file
    fi
done

## Create ~/bin if it doesn't exist
if [[ ! -d ~/bin ]]; then
    mkdir -p ~/bin
fi

## Create symlinks to ~/bin/
if [[ ! -e ~/bin/soxy ]]; then
    ln -s ~/.scripts/soxy/soxy ~/bin/soxy
fi
