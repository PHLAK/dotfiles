#!/usr/bin/env bash

## Require root privileges
if [[ "$(whoami)" != "root" ]]; then
    echo "ERROR: You must be root to run this script"; exit 1
fi

## Install python-pip if missing
if [[ ! $(dpkg -l python-pip) ]]; then
    apt-get -y install python-pip
fi

## Define Open Stack clients
clients=(
    "python-ceilometerclient"
    "python-cinderclient"
    "python-glanceclient==0.13.1"
    "python-heatclient"
    "python-keystoneclient"
    "python-neutronclient"
    "python-novaclient==2.20.0"
    "python-saharaclient"
    "python-swiftclient"
    "python-troveclient"
    "python-openstackclient"
)

## Install all the things
for client in "${clients[@]}"; do
    pip install ${client}
done
