#!/bin/bash

set -e

# load settings for iTerm from dotfiles
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/topics/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

