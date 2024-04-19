#!/usr/bin/env bash

# install dotfiles
DOTFILES=(".vimrc" ".ideavimrc")
DOTFILES_PATH=$HOME/workspace/git/handy/dotfiles

for FILE in "${DOTFILES[@]}"
do
    if [ -f ~/$FILE ]; then
        rm ~/$FILE
    fi
    ln -sv $DOTFILES_PATH/$FILE ~
done
