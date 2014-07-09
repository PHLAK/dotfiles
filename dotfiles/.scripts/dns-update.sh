#!/bin/bash

################################################################################
# This script requires the Linode CLI tools to be installed and configured to
# function correctly.  Get the Linode CLI here: https://github.com/linode/cli
################################################################################

## Split hostname into array
IFS='.' read -a host <<< "$1"

## Set hostname variables
sub="${host[0]}"
tld="${host[1]}.${host[2]}"
hostname="${sub}.${tld}"

## Fetch external IP
externalIP=$(wget ipcheck.phlak.net -qO-)

## Continue if IP fetched successfully
if [[ -n "$externalIP" ]]; then

    ## Fetch current IP address
    currentIP=$(dig +short $hostname)

    ## Check if IP has changed
    if [[ "$externalIP" != "$currentIP"  ]]; then

        ## Update DNS record
      linode domain record-update $tld A $sub --target $externalIP

    fi

fi
