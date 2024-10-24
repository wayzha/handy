#!/usr/bin/env bash
set -Eeuo pipefail

case "$OSTYPE" in
  darwin*|bsd*)
	  # Require gnu-sed.
		if ! [ -x "$(command -v gsed)" ]; then
  	  echo "Error: 'gsed' is not istalled." >&2
  	  echo "If you are using Homebrew, install with 'brew install gnu-sed'." >&2
  	  exit 1
  	fi
		SED_CMD=gsed
		;;
  *)
		SED_CMD=sed
    ;;
esac

# Use '${SED_CMD}' instead of 'sed'
# ${SED_CMD} -i'' -e 's/hello/bye/g' my_file.txt
