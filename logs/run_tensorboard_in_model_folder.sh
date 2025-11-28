#!/bin/bash
set -e

host="$(hostname)"
port=25565
address="http://$host:$port"

echo "$address"

read -rp "Key in model saved directory: " UserInputPath

if [ -z "$UserInputPath" ]; then
    echo "No directory provided. Exiting."
    exit 1
fi

if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$address" >/dev/null 2>&1 &
elif command -v open >/dev/null 2>&1; then
    open "$address" >/dev/null 2>&1 &
fi

tensorboard --logdir="$UserInputPath" --port="$port" --bind_all
