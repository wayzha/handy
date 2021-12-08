#!/usr/bin/env bash

APPS=("autojump" "tmux" "zsh" "curl")

for APP in "${APPS[@]}"; do
    if [[ $(command -v "$APP") != "" ]]; then
        echo "$APP exists..."
        APPS=("${APPS[@]/$APP}")
    fi
done

if [[ ${APPS[@]} ]]; then
    echo "Installing $APPS"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
	    if [[ $(command -v apt) != "" ]];  then
          sudo apt -y install ${APPS[@]}
        fi
	    if [[ $(command -v pacman) != "" ]];  then
	      sudo pacman -S ${APPS[@]} --noconfirm
	    fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        if [[ $(command -v brew) == "" ]]; then
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
        brew install ${APPS[@]}
    else
        # Unknown OS
        echo "Unknown OS. Do nothing..."
    fi
else
    echo "Nothing to install..."
fi
