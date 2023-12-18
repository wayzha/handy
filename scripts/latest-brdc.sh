#!/bin/bash
set -eu

## get Current year
current_year=$(date +%Y)

## get latest version
# latest_version=$(wget -qO- "ftp://gssc.esa.int/gnss/data/daily/$current_year/brdc/" | awk -F'/brdc*/' '/brdc*/{print $2}' | cut -d\" -f1 | grep -v '\index.html' | tail -1)
latest_version=$(wget -qO- "ftp://gssc.esa.int/gnss/data/daily/2023/brdc/" | awk -F "/brdc/" '{print $2}' | cut -d \" -f1 | grep 'n.gz' | tail -1)

## download
wget "ftp://gssc.esa.int/gnss/data/daily/$current_year/brdc/$latest_version"

## uncompress
gzip -d $latest_version
