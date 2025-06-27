#!/bin/bash

SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"

FILENAME="$SAVE_DIR/shot_$(date +%Y-%m-%d_%H-%M-%S).png"

REGION=$(slurp)
if [ -z "$REGION" ]; then
    echo "Screenshot canceled"
    exit 1
fi

grim -g "$REGION" "$FILENAME" && wl-copy < "$FILENAME"
notify-send "Screenshot taken" "$FILENAME copied to clipboard"

