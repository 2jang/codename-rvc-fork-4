#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]; then
    echo "The fork shouldn't be run as root. Don't do that."
    read -rp "Press enter to exit..." _
    exit 1
fi

if [ ! -d "env" ]; then
    echo "Please run 'run-install.sh' first to set up the environment."
    read -rp "Press enter to exit..." _
    exit 1
fi

printf "\033]0;Codename-RVC-Fork-4\007"
clear

env/bin/python app.py --open
