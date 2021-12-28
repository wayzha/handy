#!/usr/bin/env bash

SERVER_URL="www.google.com"

wget -q -t 1 --timeout=1 --spider $SERVER_URL
if [ $? != 0 ]; then
  if [[ $(command -v proxy-localhost.sh) != "" ]]; then
    echo "-----> Set Proxy."
    source proxy-localhost.sh
    wget -q -t 1 --timeout=1 --spider $SERVER_URL
    if [ $? != 0 ]; then
      echo "-----> Unset Proxy."
      source proxy-unset.sh
    fi
  fi
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  if [[ $(command -v apt) != "" ]];  then
    sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
  fi
  if [[ $(command -v pacman) != "" ]];  then
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

if [[ -d ~/workspace/git/handy ]]; then
  cd ~/workspace/git/handy
  git pull
fi
