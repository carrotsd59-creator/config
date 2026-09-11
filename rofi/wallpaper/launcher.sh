#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

while IFS= read -r -d '' wallpaper; do
    name="$(basename "$wallpaper")"

    printf '%s\0icon\x1f%s\n' \
        "$name" \
        "$wallpaper"

done < <(
    find "$WALLPAPER_DIR" -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) \
        -print0
) |
rofi \
    -dmenu \
    -show-icons \
    -theme ~/.config/rofi/wallpaper/wallpaper.rasi |
while IFS= read -r name; do

    wallpaper="$(find "$WALLPAPER_DIR" -type f -name "$name" -print -quit)"

    [ -z "$wallpaper" ] && exit 0

    awww img "$wallpaper" \
        --transition-type grow \
        --transition-duration 0.5

    matugen image "$wallpaper" \
        --source-color-index 0

done
