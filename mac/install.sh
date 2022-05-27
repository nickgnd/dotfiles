#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

# You can find more macOS defaults here:
# - https://macos-defaults.com/
# - https://github.com/mathiasbynens/dotfiles

info "SET MACOS DEFAULTS…"

# General
info "Disable auto-correct…"
defaults write -globalDomain "NSAutomaticSpellingCorrectionEnabled" -bool false

info "Disable auto-capitalization…"
defaults write -globalDomain "NSAutomaticCapitalizationEnabled" -bool false

info "Disable screensaver…"
defaults -currentHost write com.apple.screensaver "idleTime" -int 0

# Theme
info "Use dark mode…"
defaults write -g AppleInterfaceStyle -string "Dark"

# Finder
info "Show hidden files in Finder…"
defaults write com.apple.finder "AppleShowAllFiles" -bool true

info "Show file extensions in Finder…"
defaults write -globalDomain "AppleShowAllExtensions" -bool true

info "Show path bar…"
defaults write com.apple.finder "ShowPathbar" -bool "true"

info "Hide Macintosh HD on desktop…"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool false

info "Show external and removable harddrives on desktop…"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool true
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool true

info "Use column view by default…"
defaults write com.apple.Finder "FXPreferredViewStyle" clmv

info "Don't rearrange spaces based on use…"
defaults write com.apple.dock "mru-spaces" -bool "false"

info "Set Finder sidebar icon size to small…"
defaults write -g NSTableViewDefaultSizeMode -int 1

info "Avoid creating .DS_Store files on network and USB volumes…"
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool true
defaults write com.apple.desktopservices "DSDontWriteUSBStores" -bool true

info "Expand save panel by default…"
defaults write -g "NSNavPanelExpandedStateForSaveMode" -bool true

info "Use AirDrop over every interface…"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

info "Show the ~/Library folder…"
chflags nohidden ~/Library

info "Set home as the default location for new Finder windows…"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

info "Restarting finder…"
killall Finder

# Dock
info "Auto-hide dock…"
defaults write com.apple.dock "autohide" -bool true

info "Don't show recent apps in dock…"
defaults write com.apple.dock "show-recents" -bool false

info "Set the icon size of Dock items to 36 pixels…"
defaults write com.apple.dock tilesize -int 36

info "Restarting the dock…"
killall Dock

# Hot corners
## https://blog.jiayu.co/2018/12/quickly-configuring-hot-corners-on-macos/
## Use this command to check current config `defaults read com.apple.dock | grep wvous`

## Show desktop on bottom-right
info "Set hot corners…"
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

info "Restarting the dock…"
killall Dock

# Input
info "Set fast key-repeat-rate…"
defaults write -globalDomain "InitialKeyRepeat" -int 15
defaults write -globalDomain "KeyRepeat" -int 2

info "Set fast scroll speed…"
defaults write -globalDomain "com.apple.mouse.scaling" -int 2
defaults write -globalDomain "com.apple.trackpad.scaling" -int 2

info "Enable tab to click…"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool true
defaults write com.apple.AppleMultitouchTrackpad "Clicking" -bool true
defaults -currentHost write -globalDomain "com.apple.mouse.tapBehavior" -int 1

info "Enable mouse right-click…"
defaults write "com.apple.driver.AppleBluetoothMultitouch.mouse" MouseButtonMode TwoButton
defaults write "com.apple.AppleMultitouchMouse.plist" MouseButtonMode TwoButton

info "Disable press-and-hold for keys in favor of key repeat…"
defaults write -g ApplePressAndHoldEnabled -bool false

info "Show scrollbars when scrolling…"
defaults write -g AppleShowScrollBars -string "WhenScrolling"

info "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)…"
defaults write -g AppleKeyboardUIMode -int 3

## Language & Region
info "Set language and text formats…"
defaults write -g AppleLanguages -array "en-US"
defaults write -g AppleLocale -string "en_US@currency=EUR"
defaults write -g AppleMeasurementUnits -string "Centimeters"
defaults write -g AppleTemperatureUnit -string "Celsius"
defaults write -g AppleMetricUnits -bool true
