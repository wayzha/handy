#!/usr/bin/env bash

source ${0%/*}/udy-env.sh

if [[ -d ~/workspace/git/handy ]]; then
  echo "-----> Update Handy:"
  cd ~/workspace/git/handy
  git pull
fi

echo "-----> Update OS Packages:"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  if [[ $(command -v apt-get) != "" ]];  then
    sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
  elif [[ $(command -v pacman) != "" ]];  then
    if [[ $(command -v yay) != "" ]]; then
      yay --noconfirm
    else
      sudo pacman -Syu --noconfirm
    fi
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    if [[ $(command -v brew) != "" ]]; then
      brew update && brew upgrade
    fi
else
    # Unknown OS
    echo "-----> Unknown OS. No Package Update!"
fi
