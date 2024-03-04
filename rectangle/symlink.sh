#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "./../script/lib/utils.sh"

# https://github.com/rxhanson/Rectangle?tab=readme-ov-file#import--export-json-config
dst="${HOME}/Library/Application Support/Rectangle/"
mkdir -p "$dst"
create_symlinks "$(pwd)" "$dst"
