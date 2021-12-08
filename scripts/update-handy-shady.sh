#!/usr/bin/env bash

if [[ -d ~/workspace/git/handy ]]; then
  cd ~/workspace/git/handy
  git pull
fi

if [[ -d ~/workspace/git/shady ]]; then
  cd ~/workspace/git/shady
  git pull
fi
