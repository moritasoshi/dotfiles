#!/bin/bash

set -e

cd $(dirname $0)
echo pwd: $(pwd)

echo "+++++Export Brewfile......"
brew bundle dump && mv Brewfile ../etc/homebrew && echo "Done!"

echo "+++++Export Spectacle Sortcuts......"
cp ~/Library/Application\ Support/Spectacle/Shortcuts.json ../etc/spectacle/ && echo "Done!"

