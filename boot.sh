#!/usr/bin/env bash

set -e

echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Dotfiles..."
rm -rf ~/src/dotfiles
git clone https://github.com/moritasoshi/dotfiles.git ~/src/dotfiles >/dev/null

cd ~/src/dotfiles
git fetch && git checkout feature/one-line
git remote set-url origin git@github.com:moritasoshi/dotfiles.git

echo "Installation starting..."
~/src/dotfiles/bootstrap.sh -i
