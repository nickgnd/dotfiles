#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "./../script/lib/utils.sh"

TOPIC_DIR=$(pwd)
SYMLINKS=$(find "$TOPIC_DIR" -maxdepth 1 -name "*.symlink")
readonly TOPIC_DIR
readonly SYMLINKS

for src in $SYMLINKS; do
  name=$(basename "$src" .symlink)
  dest="$HOME/.$name"
  symlink "$src" "$dest"
done
