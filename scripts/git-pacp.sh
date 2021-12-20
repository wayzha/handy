#!/usr/bin/env bash

COMMIT_MESSAGE="update"

[ -n "$1" ] && COMMIT_MESSAGE=$1

git pull && git add -A && git commit -m $COMMIT_MESSAGE && git push
