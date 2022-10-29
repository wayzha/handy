#!/usr/bin/env bash

# link dotfiles
DOTFILES=(".zshenv" ".zshrc" ".p10k.zsh" ".zshrc_kali")
DOTFILES_PATH=$HOME/workspace/git/handy/dotfiles

for FILE in "${DOTFILES[@]}"
do
    if [ -f ~/$FILE ]; then
        rm ~/$FILE
    fi
    ln -sv $DOTFILES_PATH/$FILE ~
done
