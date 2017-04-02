#!/bin/sh

sudo "$(which info-beamer)" . &

sleep 1 &&
./update.py
