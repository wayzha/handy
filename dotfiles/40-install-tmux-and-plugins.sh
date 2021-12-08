#!/usr/bin/env bash

# install dotfiles
DOTFILES=(".tmux.conf" ".tmux.conf.local")

for FILE in "${DOTFILES[@]}"
do
    if [ -f ~/$FILE ]; then
        rm ~/$FILE
    fi
done

cd
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -sv ~/.tmux/.tmux.conf ~

DOTFILES=(".tmux.conf.local")
DOTFILES_PATH=$HOME/workspace/git/handy/dotfiles

for FILE in "${DOTFILES[@]}"
do
    ln -sv $DOTFILES_PATH/$FILE ~
done
