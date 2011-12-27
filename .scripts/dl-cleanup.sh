#!/bin/bash

find $HOME/Downloads -maxdepth 1 -mtime +14 -type f -delete
