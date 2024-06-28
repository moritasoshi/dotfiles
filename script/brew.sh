#!/usr/bin/env bash

install() {
  echo "Install"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

apply() {
  echo "Apply Brewfile"
  pushd ~/src/dotfiles/resource/homebrew/ || exit
  brew bundle install
  popd || exit
}

doExport() {
  echo "Export"
  pushd ~/src/dotfiles/resource/homebrew/ || exit
  brew bundle dump --force
  popd || exit
}

help() {
  echo "Usage: $(basename "$0") [options]" >&2
  echo
  echo "   -i, --install          Install homebrew and apply Brewfile"
  echo "   -a, --apply            Apply Brewfile"
  echo "   -x, --export           Export Brewfile"
  echo
  exit 1
}

if [ $# -eq 0 ]; then
  help
else
  for i in "$@"; do
    case $i in
    -i | --install)
      install
      apply
      shift
      ;;
    -a | --apply)
      apply
      shift
      ;;
    -x | --export)
      doExport
      shift
      ;;
    *)
      help
      shift
      ;;
    esac
  done
fi
