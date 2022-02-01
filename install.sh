#!/bin/sh
WORK_DIR=$(cd $(dirname $0); pwd)

install_brew() {
  if [ ! -e /usr/local/bin/brew ]; then
    echo "+++++Install Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

install_ruby() {
  if [ ! -e $HOME/.rvm/bin ]; then
    echo "+++++Install RVM..."
    curl -sSL https://get.rvm.io | bash -s stable
    . "$HOME"/.rvm/scripts/rvm
  fi
}

setup_brew() {
  echo "+++++Install Homebrew packages..."
  brew bundle --file "$WORK_DIR"/etc/homebrew/Brewfile
  echo "+++++Clean up Homebrew packages..."
  brew bundle cleanup --file "$WORK_DIR"/etc/homebrew/Brewfile
  echo "+++++brew doctor..."
  brew doctor
}

shell_check() {
  /usr/bin/grep /usr/local/bin/zsh /etc/shells && :
  if [ "$?" -ne 0 ]; then
    echo "+++++homebrewのzshに変更します"
    sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
    /usr/bin/chsh -s "$(brew --prefix)/bin/zsh"
  fi
}

install_brew
setup_brew
# install_ruby
shell_check
