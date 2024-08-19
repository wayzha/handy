#!/usr/bin/env bash
set -Eeuo pipefail

case "$OSTYPE" in
  darwin*|bsd*)
    echo "Using BSD sed style"
    sed_no_backup=( -i '' )
    ;;
  *)
    echo "Using GNU sed style"
    sed_no_backup=( -i )
    ;;
esac

# then we can use sed like below which is compatible for both Mac & Linux
# sed ${sed_no_backup[@]} -e "s/hello/bye/g" my_file.txt
