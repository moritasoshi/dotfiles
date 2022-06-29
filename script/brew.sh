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

installEssentials() {
  info "Installing essentials"

  brew install fd
  brew install fzf
  brew install git
  brew install neovim --HEAD
  brew install peco
  brew install ripgrep
  brew install tmux
  brew install vim
  brew install zsh
}

installBasics() {
  info "Installing basics"

  brew tap "homebrew/core"
  brew tap "moritasoshi/tap"

  brew install "bat"
  brew install "coreutils"
  brew install "gawk"
  brew install "gcc"
  brew install "gnu-sed"
  brew install "gnutls"
  brew install "htop"
  brew install "jq"
  brew install "lsd"
  brew install "moreutils"
  brew install "moritasoshi/tap/repoj"
  brew install "nkf"
  brew install "reattach-to-user-namespace"
  brew install "rsync"
  brew install "wget"

}

installExtras() {
  info "Installing extras"

  brew tap "adoptopenjdk/openjdk"
  brew tap "daipeihust/tap"
  brew tap "dbcli/tap"
  brew tap "homebrew/cask"

  brew install "daipeihust/tap/im-select"
  brew install "git-flow"
  brew install "jenv"
  brew install "maven"
  brew install "mycli"
  brew install "mysql"
  brew install "nodebrew"
  brew install "pgcli"
  brew install "postgresql"
  brew install "python@3.9"
  brew install "shellcheck"
  brew install "shellharden"
  brew install "shfmt"
  brew install "stylua"

  brew --cask install "adoptopenjdk11"
  brew --cask install "alacritty"
  brew --cask install "chromedriver"
  brew --cask install "clipy"
  brew --cask install "firefox"
  brew --cask install "hammerspoon"
  brew --cask install "karabiner-elements"
  brew --cask install "keepassxc"
  brew --cask install "sublime-text"

}

doExport() {
  info "Export"
  pushd ~/src/dotfiles/etc/homebrew/ || exit
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
  echo "   -e, --extras           Install extras"
  echo "   -u, --update           Update brew and formulae"
  echo "   -l, --list             List installed formulae"
  echo "   -m, --minimal          Install just the essentials"
  echo "   -x, --export           Export Brewfile"
  echo
  exit 1
}

if [ $# -eq 0 ]; then
  help
else
  for i in "$@"; do
    case $i in
      -m | --minimal)
        update
        installEssentials
        cleanup
        list
        shift
        ;;
      -i | --install)
        update
        installEssentials
        installBasics
        cleanup
        list
        shift
        ;;
      -e | --extras)
        update
        installExtras
        cleanup
        list
        shift
        ;;
      -f | --fix)
        shift
        ;;
      -u | --update)
        update
        cleanup
        shift
        ;;
      -l | --list)
        list
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
