#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

info "SET MACOS DEFAULTS…"

# General
info "Disable auto-correct…"
defaults write -globalDomain "NSAutomaticSpellingCorrectionEnabled" -bool false

info "Disable auto-capitalization…"
defaults write -globalDomain "NSAutomaticCapitalizationEnabled" -bool false

info "Disable screensaver…"
defaults -currentHost write com.apple.screensaver "idleTime" -int 0

# Finder
info "Show hidden files in Finder…"
defaults write com.apple.finder "AppleShowAllFiles" -bool true && killall Finder

info "Show file extensions in Finder…"
defaults write -globalDomain "AppleShowAllExtensions" -bool true && killall Finder

info "Show path bar…"
defaults write com.apple.finder "ShowPathbar" -bool "true"

info "Don't show harddrives on desktop…"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool false
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool false

info "Use column view by default…"
defaults write com.apple.Finder "FXPreferredViewStyle" clmv

info "Don't rearrange spaces based on use…"
defaults write com.apple.dock "mru-spaces" -bool "false"

# Dock
info "Auto-hide dock…"
defaults write com.apple.dock "autohide" -bool true && killall Dock

info "Don't show recent apps in dock…"
defaults write com.apple.dock "show-recents" -bool false && killall Dock

# Input
info "Set fast key-repeat-rate…"
defaults write -globalDomain "InitialKeyRepeat" -int 15
defaults write -globalDomain "KeyRepeat" -int 2

info "Set fast scroll speed…"
defaults write -globalDomain "com.apple.mouse.scaling" -int 3
defaults write -globalDomain "com.apple.trackpad.scaling" -int 3

info "Enable tab to click…"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool true
defaults -currentHost write -globalDomain "com.apple.mouse.tapBehavior" -int 1
