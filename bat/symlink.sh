#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

mkdir -p "${HOME}/.config/bat"
create_symlinks "$(pwd)" "${HOME}/.config/bat/"
