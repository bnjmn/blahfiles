#! /usr/bin/env sh

tarsnap -c \
    -f "$(date +%Y-%m-%d_%H-%M)-$(uname -n)" \
    "$HOME/bckp/"
