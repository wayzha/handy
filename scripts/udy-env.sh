#!/usr/bin/env bash

if [[ -z "$SERVER_URL" ]]; then
  export SERVER_URL="www.google.com"

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
fi
