#!/usr/local/bin/zsh

# variables
SOURCE_DIR=~/Code
DESTINATION=max@herrdirektor.local:
EXCLUDES='.DS_STORE'

rsync -av --delete ssh $SOURCE_DIR $DESTINATION