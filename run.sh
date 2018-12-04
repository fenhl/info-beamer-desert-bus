#!/bin/sh

# make sure everything is executed relative to this script's location
cd "${0:a:h}"

info-beamer . &

sleep 1
./update.py
