#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# shellcheck source=./utils.sh
source "$(dirname "$0")/utils.sh"

COMPUTER_NAME=$(scutil --get ComputerName)

print_question "HOW SHOULD THIS COMPUTER BE CALLED? (currently: $COMPUTER_NAME)"
printf -v prompt "\r  [ \033[0;33m!!\033[0m ] -> "
read -r -e -p "$prompt" name </dev/tty

print_info "SETTING COMPUTER NAME to '$name'…"
sudo scutil --set ComputerName "$name"
sudo scutil --set LocalHostName "$name"
