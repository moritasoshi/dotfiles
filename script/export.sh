#!/bin/bash

echo "-----  export Brewfile...  ------"
cd $(dirname $0)
brew bundle dump
mv Brewfile ../etc/homebrew
echo "Done!"
echo " "
