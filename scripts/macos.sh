####
# Finder
####
# show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -boolean true

# show file extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

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
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2
