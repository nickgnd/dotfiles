#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

# load settings for iTerm from dotfiles
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

