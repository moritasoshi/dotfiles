#!/usr/bin/env bash

info() {
  printf "\033[00;34m$@\033[0m\n"
}

update() {
  # Install Homebrew or make sure it's up to date.
  which -s brew
  if [[ $? != 0 ]]; then
    info "Installing"
    /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    info "Updating"
    brew update
    brew upgrade
  fi

  # Disable analytics.
  brew analytics off
}

install() {
  info "Install"
  pushd "$DOTPATH" || exit
  brew bundle install
  popd || exit
}

doExport() {
  info "Export"
  pushd "$DOTPATH" || exit
  brew bundle dump --force
  popd || exit
}

cleanup() {
  info "Cleanup"

  brew cleanup
}

list() {
  info "List"

  brew list
}

help() {
  echo "Usage: $(basename "$0") [options]" >&2
  echo
  echo "   -i, --install          Install"
  echo "   -u, --update           Update brew and formulae"
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
        update
        install
        cleanup
        list
        shift
        ;;
      -u | --update)
        update
        cleanup
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
