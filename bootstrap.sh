#!/usr/bin/env bash

doSync() {
  ./script/apply/bin.sh
  ./script/apply/xdg_config.sh
  if [ "$(uname)" == "Darwin" ]; then
    ./script/apply/hammerspoon.sh
  fi
}

doInstall() {
  if [ "$(uname)" == "Darwin" ]; then
    ./script/brew.sh -i
  elif [ "$(uname)" == "Linux" ]; then
    ./script/install/locale_ja.sh
  fi

  if command -v pacman &>/dev/null; then
    ./script/install/alacritty.sh
    ./script/install/applications.sh
    ./script/install/font.sh
    ./script/install/mise.sh
    ./script/install/nvim.sh
    ./script/install/xclip.sh
    ./script/install/zellij.sh
  fi
  ./script/install/sdkman.sh
  ./script/install/tmux.sh
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
      doInstall
      doSync
      shift
      ;;
    *)
      doHelp
      ;;
    esac
  done
fi
