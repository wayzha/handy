#!/usr/bin/env bash

pbpaste | textutil -convert txt -stdin -stdout -encoding 30 | pbcopy
