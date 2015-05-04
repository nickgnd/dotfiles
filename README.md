# dotfiles

Config and utility files to set up my working environment (on OSX). Inspired by [paulmillr's](https://github.com/paulmillr/dotfiles) and [ryanb's](https://github.com/ryanb/dotfiles) dotfiles. Thanks!

I use [iTerm2](http://iterm2.com/) as terminal and the great [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework to manage my zsh settings.


## content

My dotfiles include:

* home
  * files to be symlinked into the user's home directory
* sublime
  * settings for sublime text 3 to be symlinked into the sublime text application directory

* launch_agents
  * scripts for launch d to be symlinked into 'Library/LaunchAgents'

* scripts
  * useful apple scripts (to be used by launch agents)

* util
  * settings and icons for terminal and iTerm2


## getting started

cd into /~ and run:

```
curl --silent https://raw.githubusercontent.com/klappradla/dotfiles/master/install.sh | sh
```

This will clone the repo and symlink all dotfiles, launch agents and sublime settings.


## backups

'backup.plist' handles the backup process: plugging in an external harddrive will open up iTerm2 and prompt for a yes or know to perform the backup process - 'backup.sh' will sync the user's dropbox folder to the external harddrive with rsync.


## setup system from scratch

When setting up a new system, I prefer taking the time on cleaning up and focusing on what is really needed, rather than running a bootstrap script. Here some useful commands:


### OSX

###### show hidden files in finder
```
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder
```

###### show all file endings
```
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
```

###### install xcode command line tools
```
xcode-select --install
```


#### set up ssh keys

###### check for ssh key, generating if it does not exist
```
[[ -f $pub ]] || ssh-keygen -t rsa
```

###### copy public key to clipboard
```
[[ -f $pub ]] && cat $pub | pbcopy
```


#### other

###### install homebrew
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

###### install recent zsh
```
brew install zsh
```

###### use recent zsh as default (prefer to system zsh)
```
sudo sh -c echo '/usr/local/bin/zsh' > /etc/shells
chsh -s /usr/local/bin/zsh
````
