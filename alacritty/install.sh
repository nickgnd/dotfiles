#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "./../script/lib/utils.sh"

# Homebrew disabled the cask (the app isn't notarized by Apple), so install the
# official DMG from GitHub. Re-run to update. curl doesn't set the quarantine
# flag, so Gatekeeper doesn't block the first launch.
app="/Applications/Alacritty.app"

latest_url=$(curl -fsSLI -o /dev/null -w '%{url_effective}' \
  https://github.com/alacritty/alacritty/releases/latest)
latest=${latest_url##*/v}

if [[ -d $app ]]; then
  installed=$(defaults read "$app/Contents/Info.plist" CFBundleShortVersionString)
  if [[ $installed == "$latest" ]]; then
    success "Alacritty $installed is up to date"
    exit 0
  fi
fi

info "INSTALL Alacritty $latest…"
tmp=$(mktemp -d)
curl -fsSL -o "$tmp/alacritty.dmg" \
  "https://github.com/alacritty/alacritty/releases/download/v$latest/Alacritty-v$latest.dmg"
hdiutil attach -nobrowse -quiet -mountpoint "$tmp/mnt" "$tmp/alacritty.dmg"
rm -rf "$app"
cp -R "$tmp/mnt/Alacritty.app" "$app"
hdiutil detach -quiet "$tmp/mnt"
rm -rf "$tmp"
success "Alacritty $latest installed"
