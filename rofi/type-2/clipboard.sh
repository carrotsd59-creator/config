#!/usr/bin/env bash

dir="$HOME/.config/rofi/type-2"
theme="style-2"

cliphist list | rofi -dmenu \
    -theme "${dir}/${theme}.rasi" |
    cliphist decode |
    wl-copy
