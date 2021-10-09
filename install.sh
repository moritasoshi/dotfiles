#!/bin/sh
WORK_DIR=$(cd $(dirname $0); pwd)

# install brew
# brewのインストール
if [ ! -e /usr/local/bin/brew ]; then
  echo "homebrewをインストールします"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# brew bundle 叩く
echo "Brewfileにリストされているアプリケーションをインストールします"
brew bundle --file "$WORK_DIR"/etc/homebrew/Brewfile

echo "BrewfileにリストされているアプリケーションをClean Upします"
brew bundle cleanup --file "$WORK_DIR"/etc/homebrew/Brewfile

# brew doctorで状態確認
echo
echo 'homebrewの状態を確認します'
brew doctor

# change shell
/usr/bin/grep /usr/local/bin/zsh /etc/shells && :
if [ "$?" -ne 0 ]; then
  echo "homebrewのzshに変更します"
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
  /usr/bin/chsh -s "$(brew --prefix)/bin/zsh"
fi

. ./deploy.sh
