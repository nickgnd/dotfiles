# ~/dotfiles

Config and utility files to set up my working environment (on OSX). Inspired by [paulmillr's](https://github.com/paulmillr/dotfiles) and [ryanb's](https://github.com/ryanb/dotfiles) dotfiles. Thanks!

I use [iTerm2](http://iterm2.com/) as terminal and the great [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework to manage my zsh settings.


## Directory

```
.
├── bin (*.sh scripts to symlink and backup)
├── home (symlinked to ~/)
│   ├── .gemrc (global config for ruby gems)
│   ├── .gitconfig (global git config)
│   ├── .gitignore_global (global gitignore)
│   └── .zshrc (zsh/oh-my-zsh config)
│
├── launch_agents (symlinked to ~/Library/LaunchAgents)
│   └── backup.plist (to launch backup process)
│
├── scripts (executed for backup process)
│   └── backup.scpt
│
└── sublime (symlinked to ~/Library/Application Support/Sublime Text 3)
    └── Packages
        └── User
            └── *.sublime-settings
 

```

* bin: shell scripts for symlinking and backup

* home: files symlinked to ~/

* sublime: settings for sublime text 3 symlinked to sublime text application directory

* launch_agents: scripts for launchD symlinked to '~/Library/LaunchAgents'

* scripts: apple scripts (used by launch agents)

* util: application settings and icons


## Getting started

cd into /~ and run:

```
curl --silent https://raw.githubusercontent.com/klappradla/dotfiles/master/bin/install.sh | sh
```

This will clone the repo and symlink all dotfiles, launch agents and sublime settings.


## Usage

### Dotfiles

Configs for:
* git
* gemrc (install gems without rdoc)
* zsh


### Backups

Automated task watching for mounting of harddrive to backup local Dropbox folder:

'backup.plist' handles the backup process: plugging in an external harddrive will open up iTerm2 and prompt for a yes or now to perform the backup process - 'backup.sh' will sync the user's dropbox folder to the external harddrive with rsync.


### Terminal / iTerm setup

Terminal: import profile from 'util/terminal'

iTerm2: set preferences path to '~/dotfiles/util/iterm2'


## Setup system from scratch

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
