#!/usr/bin/env bash

doSync() {
  ./script/apply/bin.sh
  ./script/apply/xdg_config.sh
  ./script/apply/xdg_data.sh
  ./script/apply/alacritty.sh
  ./script/apply/ghostty.sh
  if [ "$(uname)" == "Darwin" ]; then
    ./script/apply/hammerspoon.sh
  fi
}

doInstall() {
  if [ "$(uname)" == "Darwin" ]; then
    ./script/brew.sh -i
    ./script/install/font-mac.sh
  elif [ "$(uname)" == "Linux" ]; then
    ./script/install/tools.sh

    ./script/install/alacritty.sh
    ./script/install/ghostty.sh
    ./script/install/applications.sh
    ./script/install/brave.sh
    ./script/install/fish.sh
    ./script/install/font.sh
    ./script/install/im.sh
    ./script/install/locale_ja.sh
    ./script/install/mise.sh
    ./script/install/nvim.sh
    ./script/install/sdkman.sh
    ./script/install/tmux.sh
  fi

  ./script/tmux-italic.sh -i
  ./script/post_install.sh
}

doHelp() {
  echo "Usage: $(basename "$0") [options]" >&2
  echo
  echo "   -s, --sync             Synchronize dotfiles to home directory"
  echo "   -i, --install          Install packages"
  echo
  exit 1
}

if [ $# -eq 0 ]; then
  doHelp
else
  for i in "$@"; do
    case $i in
    -s | --sync)
      doSync
      shift
      ;;
    -i | --install)
      doSync
      doInstall
      shift
      ;;
    *)
      doHelp
      ;;
    esac
  done
fi
