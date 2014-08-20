#!/usr/bin/env bash

## Require root privileges
if [[ "$(whoami)" != "root" ]]; then
    echo "ERROR: You must be root to run this script"
    exit 1
fi

## Install python-pip if missing
if [[ ! $(dpkg -l python-pip) ]]; then
    apt-get -y install python-pip
fi

## Define Open Stack clients
clients="ceilometer cinder glance heat keystone neutron nova swift trove"

## Install all the things
for client in $clients; do
    pip install python-${client}client
done
