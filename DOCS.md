# Docs

## Troubleshooting Guide

### XCode Command Line Tools

If not prompted when using `git` for the first time, manually install the XCode Command Line Tools:

	xcode-select --install

### iterm

If the preferences aren't picked up automatically: point **`Load preferences from custom folder or URL`** to `~/dotfiles/iterm2`

If the settings are not applied, run:

	defaults read com.googlecode.iterm2

### SSH

To manually add keys to the macOS ssh-agent:

    ssh-add -K ~/.ssh/id_rsa

The ssh-agent can then automatically load the key from the macOS keychain every time it needs it.

### Firewall

Allow rbenv's ruby on the macOS firewall *(same for other executables)*

    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add /Users/max/.rbenv/shims/ruby

    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add /Users/max/.asdf/shims/ruby

### Git Submodules

Update all submodules to the latest tips of their remote branches:

    git submodule update --recursive --remote
