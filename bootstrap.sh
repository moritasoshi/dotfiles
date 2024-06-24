#!/usr/bin/env bash

DOTFILES=$(dirname "$0")
XDG_CONFIG_HOME=$HOME/.config

info() {
  printf "\033[00;34m%s\033[0m\n" "$@"
}

doInstall() {
  info "Installing Extras"

  # tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  # fzf

  info "Creating XDG_CONFIG_HOME"
  mkdir -p "$XDG_CONFIG_HOME"
}

doSync() {
  info "Sync"
  # sync home dir
  rsync \
    --no-perms \
    -avh \
    "$DOTFILES"/home/ \
    "$HOME"

  # sync xdg config dir
  ensure_ignored=("nvim")
  linux_ignore=("karabiner")
  config_list=$(ls "$DOTFILES"/xdg/config)
  for app in ${config_list[@]}; do
    if echo $ensure_ignored | grep -qw "$app"; then
      continue
    fi
    if [ "$(uname)" == "Linux" ] && echo $linux_ignore | grep -qw "$app"; then
      info "Skip $app for Linux"
      continue
    fi
    rsync \
      --no-perms \
      -avh \
      "$DOTFILES"/xdg/config/"$app" \
      "$XDG_CONFIG_HOME"/
  done

  info "Symbolic links"
  ln -sv "$DOTPATH"/xdg/config/nvim "$XDG_CONFIG_HOME"/
}

doFonts() {
  info "Installing Fonts"

  if [ "$(uname)" == "Darwin" ]; then
    fonts=~/Library/Fonts
  elif [ "$(uname)" == "Linux" ]; then
    fonts=~/.fonts
    mkdir -p "$fonts"
  fi

  find "$DOTFILES/fonts/" -name "*.[o,t]tf" -type f | while read -r file; do
    cp -v "$file" "$fonts"
  done
}

doAll() {
  doInstall
  doFonts
  doSync
}

doHelp() {
  echo "Usage: $(basename "$0") [options]" >&2
  echo
  echo "   -s, --sync             Synchronizes dotfiles to home directory"
  echo "   -i, --install          Install (extra) software"
  echo "   -f, --fonts            Copies font files"
  echo "   -c, --config           Configures your system"
  echo "   -a, --all              Does all of the above"
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
      doFonts
      shift
      ;;
    -f | --fonts)
      doFonts
      shift
      ;;
    -c | --config)
      doConfig
      shift
      ;;
    -a | --all)
      doAll
      shift
      ;;
    *)
      doHelp
      ;;
    esac
  done
fi
