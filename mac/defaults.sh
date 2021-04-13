#!/bin/bash

# set -e
set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

###
# General
####
# disable autocorrect
defaults write -globalDomain "NSAutomaticSpellingCorrectionEnabled" -boolean false
# disable auto-capitalization of words
defaults write -globalDomain "NSAutomaticCapitalizationEnabled" -boolean false

# never start screensaver
defaults -currentHost write com.apple.screensaver "idleTime" -int 0

####
# Finder
####
# show hidden files in Finder
defaults write com.apple.finder "AppleShowAllFiles" -boolean true && killall Finder

# show file extensions in Finder
defaults write -globalDomain "AppleShowAllExtensions" -boolean true && killall Finder

# do not show hard drives on desktop
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -boolean false

# use column view by default
defaults write com.apple.Finder "FXPreferredViewStyle" clmv

# don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock "mru-spaces" -boolean "false"

# show pathbar
defaults write com.apple.finder "ShowPathbar" -boolean "true"

####
# Dock
####

# show and hide Dock
defaults write com.apple.dock "autohide" -boolean true && killall Dock

# don’t show recent applications in Dock
defaults write com.apple.dock "show-recents" -boolean false && killall Dock

####
# Keyboard
####

# set fast key repeat rate
defaults write -globalDomain "InitialKeyRepeat" -int 15
defaults write -globalDomain "KeyRepeat" -int 2

####
# Touchpad
####

# enable tab to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -boolean true
defaults -currentHost write -globalDomain "com.apple.mouse.tapBehavior" -int 1

## increase scrolling speed of trackpad
defaults write -globalDomain "com.apple.trackpad.scaling" -int 3

####
# Mouse
####

# increase scrolling speed of mouse
defaults write -globalDomain "com.apple.mouse.scaling" -int 3
