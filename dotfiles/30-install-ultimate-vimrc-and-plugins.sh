#!/usr/bin/env bash

# install ultimate vim configuration
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
rm ~/.vimrc
sh ~/.vim_runtime/install_awesome_vimrc.sh

# install number toggle plugin
git clone https://github.com/jeffkreeftmeijer/vim-numbertoggle ~/.vim_runtime/my_plugins/vim-numbertoggle
# install plantuml previewer plugin and dependencies
git clone https://github.com/tyru/open-browser.vim ~/.vim_runtime/my_plugins/open-browser
git clone https://github.com/aklt/plantuml-syntax ~/.vim_runtime/my_plugins/plantuml-syntax
git clone https://github.com/weirongxu/plantuml-previewer.vim ~/.vim_runtime/my_plugins/plantuml-previewer

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
