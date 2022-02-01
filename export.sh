#!/bin/bash

set -e

BREW_DIR=~/src/dotfiles/etc/homebrew/
SPECTACLE_DIR=~/src/dotfiles/etc/spectacle/
SPECTACLE_HOME=~/Library/Application\ Support/Spectacle/

# export Brewfile
pushd "$BREW_DIR"
brew bundle dump --force
popd

# export Spectacle Sortcuts.json
pushd "$SPECTACLE_HOME"
cp Shortcuts.json "$SPECTACLE_DIR"
popd
