# dotfiles …what else?

How I set up my dev system.

![screenshot](./screenshot.png)

## A bit of history

This is my third attempt trying to setup my dotfiles.
It is needless to say that I failed badly the first 2 times, but I'm beliver and I don't wanna give up.

These dotfiles originates from a fork of the excellent work done by [Max](https://github.com/klappradla/dotfiles) and with some copy-pasta from [Paul's dotfiles](https://github.com/pmeinhardt/dotfiles).
Thanks Max and Paul for all the 🐟.

## About

My dotfiles follow [holman](https://github.com/holman/dotfiles)'s concept of _"topical"_ organization. Each topic has its own directory with special filename conventions ⚡️:

- **topic/install.sh**: script executed when installing/updating the topic
- **topic/symlink.sh**: script executed when symlinking the topic
- **topic/name.symlink**: files picked up by the `symlink.sh` script of the topic
- **topic/finalize.sh**: script executed at the end, after the installation/update and the symlink

_(Note: the `homebrew` topic is always evaluated first as other topics depend on it.)_

## Installation

_(on new computer: set up ssh keys first)_

```sh
# start in the home directory
cd

# clone repository
git clone --recursive git@github.com:nickgnd/dotfiles.git

# navigate into the new directory
cd dotfiles

# run the install script
script/setup
```

_See [docs](./DOCS.md) for additional help._
