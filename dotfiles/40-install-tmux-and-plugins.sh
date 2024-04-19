#!/usr/bin/env bash

# dotfiles
RM_DOTFILES=(".tmux.conf" ".tmux.conf.local")
LN_DOTFILES=(".tmux.conf.local")
DOTFILES_PATH=$HOME/workspace/git/handy/dotfiles

for FILE in "${RM_DOTFILES[@]}"
do
    if [ -f ~/$FILE ]; then
        rm ~/$FILE
    fi
done

git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -sv ~/.tmux/.tmux.conf ~

for FILE in "${LN_DOTFILES[@]}"
do
    ln -sv $DOTFILES_PATH/$FILE ~
done
