#!/bin/sh
#
# Set iTerm2 custom profile (needs a restart of the application)
#
# (http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/)

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$ZSHDOT/iterm"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
