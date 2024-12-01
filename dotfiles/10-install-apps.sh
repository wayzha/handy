#!/usr/bin/env bash

APPS=("tmux" "zsh" "curl" "jq")
for APP in "${APPS[@]}"; do
    if [[ $(command -v "$APP") != "" ]]; then
        echo "$APP exists..."
        APPS=("${APPS[@]/$APP}")
    fi
done

APPS2=("autojump" "mosh")
for APP in "${APPS2[@]}"; do
    if [[ $(command -v "$APP") != "" ]]; then
        echo "$APP exists..."
        APPS2=("${APPS2[@]/$APP}")
    fi
done

if [[ ${APPS[@]} || ${APPS2[@]} ]]; then
    echo "Installing $APPS"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      # Linux
	    if [[ $(command -v apt-get) != "" ]];  then
        sudo apt-get update
        sudo apt-get -y install ${APPS[@]}
        sudo apt-get -y install ${APPS2[@]}
      fi
	    if [[ $(command -v pacman) != "" ]];  then
        ../scripts/arch/add-archlinuxcn.sh
        ../scripts/arch/pacman-essential.sh
        ../scripts/arch/update-pacman-conf.sh
	      sudo pacman -S ${APPS[@]} --noconfirm
	      sudo pacman -S ${APPS2[@]} --noconfirm
	    fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        if [[ $(command -v brew) == "" ]]; then
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
        brew install ${APPS[@]}
        brew install ${APPS2[@]}
    else
        # Unknown OS
        echo "Unknown OS. Do nothing..."
    fi
else
    echo "Nothing to install..."
fi
