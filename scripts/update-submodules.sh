#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# shellcheck source=./utils.sh
source "$(dirname "$0")/utils.sh"

cd "$(dirname "$0")/.."
print_info "UPDATE GIT SUBMODULES…"
exec git submodule update --remote
