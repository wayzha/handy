#!/usr/bin/env bash

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoupdate

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# link dotfiles
DOTFILES=(".zshenv" ".zshrc" ".p10k.zsh" ".zshrc_kali" ".zshrc_mac" ".zshenv_mac")
DOTFILES_PATH=$HOME/workspace/git/handy/dotfiles

for FILE in "${DOTFILES[@]}"
do
    if [ -f ~/$FILE ]; then
        rm ~/$FILE
    fi
    ln -sv $DOTFILES_PATH/$FILE ~
done
