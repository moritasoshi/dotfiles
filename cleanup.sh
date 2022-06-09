#!/bin/bash

set -e

# zinit
rm -rf "$HOME/.zinit"
# vim
rm -rf "$HOME/.vim"

# lsd,fd,ripgrep
sudo apt uninstall lsd fd ripgrep peco stow


echo "Delete dotfiles directory!"
