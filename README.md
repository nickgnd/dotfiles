# dotfiles 🏗

How I set up my dev system.

![screenshot](./screenshot.png)

## About

My dotfiles follow [holman](https://github.com/holman/dotfiles)'s concept of _"topical"_ organization. Each topic has its own directory with special filename conventions ⚡️:

- **bin/**: contains executables added to `$PATH`
- **topic/install.sh**: script executed when installing/updating the topic
- **topic/symlink.sh**: script executed when symlinking the topic
- **topic/name.symlink**: files picked up by the `symlink.sh` script of the topic

_(Note: the `homebrew` topic is always evaluated first as other topics depend on it.)_

## Installation

_(on new computer: set up ssh keys first)_

```sh
# start in the home directory
cd

# clone repository
git clone --recursive git@github.com:klappradla/dotfiles.git

# navigate into the new directory
cd dotfiles

# run the install script
script/setup
```

_See [docs](./DOCS.md) for additional help._
