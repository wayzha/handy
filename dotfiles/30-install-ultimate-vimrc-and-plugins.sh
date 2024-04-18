#!/usr/bin/env bash

# install ultimate vim configuration
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
rm ~/.vimrc
sh ~/.vim_runtime/install_awesome_vimrc.sh

# install ideavimrc dotfiles
DOTFILES=(".ideavimrc")
DOTFILES_PATH=$HOME/workspace/git/handy/dotfiles

for FILE in "${DOTFILES[@]}"
do
    if [ -f ~/$FILE ]; then
        rm ~/$FILE
    fi
    ln -sv $DOTFILES_PATH/$FILE ~
done

# install vim runtime dotfiles
DOTFILES=("my_configs.vim")
DOTFILES_PATH=$HOME/workspace/git/handy/dotfiles/.vim_runtime
TARGET_PATH=$HOME/.vim_runtime

for FILE in "${DOTFILES[@]}"
do
    if [ -f ~/$FILE ]; then
        rm ~/$FILE
    fi
    ln -sv $DOTFILES_PATH/$FILE $TARGET_PATH
done
