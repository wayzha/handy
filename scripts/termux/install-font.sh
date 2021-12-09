#!/usr/bin/env bash

mkdir ~/.termux
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf -o ~/.termux/font.ttf
termux-reload-settings
