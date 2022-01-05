#!/usr/bin/env bash

sudo reflector --country China --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy
