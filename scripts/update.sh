#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$(dirname "$0")

# shellcheck source=./utils.sh
source "$SCRIPT_DIR/utils.sh"

cd "$(dirname "$0")/.."
print_info "UPDATE GIT SUBMODULES…"
git submodule update --remote

print_info "UPDATE GIT SUBMODULES…"
"$SCRIPT_DIR/install.sh"
