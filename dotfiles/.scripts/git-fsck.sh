#!/bin/bash

## Set your workspace
workspace="$HOME/Dropbox/workspace/"

## Find all git repositories
dirs=$(find $workspace -name '.git' -type d)

## Loop through all the repos
while read line; do

    ## cd to directory
    cd "$line/../"

    ## Do the cleaning
    git fsck && git gc

done
