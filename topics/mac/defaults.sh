#!/bin/bash

set -e

###
# General
####
# disable autocorrect
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
# disable auto-capitalization of words
defaults write -g NSAutomaticCapitalizationEnabled -bool false


# never start screensaver
defaults -currentHost write com.apple.screensaver idleTime -int 0

####
# Finder
####
# show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -boolean true

# show file extensions in Finder
defaults write -g AppleShowAllExtensions -bool true

# do not show hard drives on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

# use column view by default
defaults write com.apple.Finder FXPreferredViewStyle icnv

# don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# show pathbar
defaults write com.apple.finder ShowPathbar -bool true

## fix sluggish fonts on external monitors with macOS Mojave
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

####
# Dock
####

# show and hide Dock
defaults write com.apple.dock autohide -bool true

# don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

####
# Keyboard
####

# set fast key repeat rate
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

####
# Touchpad
####

# enable tab to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1

## increase scrolling speed of trackpad
defaults write -g com.apple.trackpad.scaling -int 3

#####
## Mouse
#####

## increase scrolling speed of mouse
defaults write -g com.apple.mouse.scaling -int 3

####
# Apps
####

# load settings for iTerm from dotfiles
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
