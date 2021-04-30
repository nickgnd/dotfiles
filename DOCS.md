# Docs

## Disk Encryption

Turn on FileVault:

    fdesetup status

If it is not turned on, enable:

    sudo fdesetup enable

## Troubleshooting Guide

### XCode Command Line Tools

If not prompted when using `git` for the first time, manually install the XCode Command Line Tools:

	xcode-select --install

### iTerm

If the preferences aren't picked up automatically: point **`Load preferences from custom folder or URL`** to `~/dotfiles/iterm2`

If the settings are not applied, run:

	defaults read com.googlecode.iterm2

### SSH

To manually add keys to the macOS ssh-agent:

    ssh-add -K ~/.ssh/id_rsa

The ssh-agent can then automatically load the key from the macOS keychain every time it needs it.

### Firewall

Allow rbenv's ruby on the macOS firewall *(same for other executables)*

    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add /Users/nicolo.gnudi/.rbenv/shims/ruby

    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add /Users/nicolo.gnudi/.asdf/shims/ruby

### Git Submodules

Update all submodules to the latest tips of their remote branches:

    git submodule update --recursive --remote

### Compinit insecure directories

If you receive a warning message by ZSH's completion system `compinit` when starting a new session, like:

    zsh compinit: insecure directories, run compaudit for list.
    Ignore insecure directories and continue [y] or abort compinit [n]?

You can list the insecure directories with this command:

    compaudit
    There are insecure directories:
    /usr/local/share/zsh/site-functions
    /usr/local/share/zsh

You can change the owner and group of these directories by running these 2 commands:

    compaudit | xargs chown -R "$(whoami)"
    compaudit | xargs chmod go-w

More info at https://stackoverflow.com/a/43544733