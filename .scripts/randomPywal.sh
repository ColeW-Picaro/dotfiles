#!/bin/bash

# This script selects a random wallpaper in the ~/Pictures/Wallpapers directory and
# runs pywal on it

files=($HOME/Pictures/Wallpapers/*)
printf "%s\n" "${files[RANDOM % ${#files[@]}]}"
wal -a 90 -i ~/Pictures/Wallpapers/"$file" --backend colorthief
