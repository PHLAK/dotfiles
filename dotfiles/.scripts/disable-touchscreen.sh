#!/usr/bin/env bash
set -o errexit

## Disable touchscren
until xinput --disable 'Atmel Atmel maXTouch Digitizer'; do
    sleep 10
done

notify-send "Touchscreen has been disabled"
