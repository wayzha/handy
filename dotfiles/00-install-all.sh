#!/usr/bin/env bash

echo "===> Install apps:"
./10-install-apps.sh

echo "===> Install oh-my-zsh and plugins:"
./20-install-oh-my-zsh-and-plugins.sh

echo "===> Install ultimate vimrc and plugins:"
./30-install-vimrc-and-plugins.sh

echo "===> Install tmux and plugins:"
./40-install-tmux-and-plugins.sh

