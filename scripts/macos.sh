###
# General
####
# disable autocorrect
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

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

####
# Dock
####

# show and hide Dock
defaults write com.apple.dock autohide -bool true

####
# Keyboard
####

# set fast key repeat rate
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

####
# Apps
####
# load settings for iTerm from dotfiles
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
