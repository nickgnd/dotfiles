#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$(dirname "$0")

# shellcheck source=./utils.sh
source "$SCRIPT_DIR/utils.sh"

COMPUTER_NAME=$(scutil --get ComputerName)

print_question "HOW SHOULD THIS COMPUTER BE CALLED? (currently: $COMPUTER_NAME)"
printf -v prompt "\r  [ \033[0;33m!!\033[0m ] -> "
read -r -e -p "$prompt" name </dev/tty

print_info "SETTING COMPUTER NAME to '$name'…"
sudo scutil --set ComputerName "$name"
sudo scutil --set LocalHostName "$name"

print_info "INSTALLING TOPICS…"
"$SCRIPT_DIR/install.sh"