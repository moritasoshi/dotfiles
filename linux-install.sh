#!/bin/bash

dotfiles=$(dirname "$0")

info() {
  printf "\033[00;34m%s\033[0m\n" "$@"
}

doInstall() {
  info "Installing Tmux plugin"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  info "Installing Fonts"
  if [ "$(uname)" == "Darwin" ]; then
    fonts=~/Library/Fonts
  elif [ "$(uname)" == "Linux" ]; then
    fonts=~/.fonts
    mkdir -p "$fonts"
  fi
  find "$dotfiles/fonts/" -name "*.[o,t]tf" -type f | while read -r file; do
    cp -v "$file" "$fonts"
  done
}

doSync() {
  info "Symbolic links for bin"
  rsync --no-perms -avh \
    "$dotfiles"/home/bin \
    "$HOME/bin"

  info "Rsync for xdg configs"
  config_list=$(ls "$dotfiles"/xdg/config)
  for app in ${config_list[@]}; do
    rsync --no-perms -avh \
      "$dotfiles"/xdg/config/"$app" \
      "$HOME/.config"/
  done

  info "Symbolic links for xdg configs"
  links=("nvim" "git" "alacritty" "lsd" "neofetch")
  for app in ${links[@]}; do
    ln --symbolic --force --verbose \
      "$dotfiles"/xdg/config/"$app" "$HOME/.config"/
  done
}

doInstall
doSync
./script/ja.sh
./script/tmux-italic.sh -i
./script/tmux-italic.sh -c