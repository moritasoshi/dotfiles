#!/bin/bash

set -e

BREW_DIR=~/src/dotfiles/etc/homebrew/

# export Brewfile
pushd "$BREW_DIR"
brew bundle dump --force
popd
