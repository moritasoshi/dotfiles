#!/bin/bash

set -e

rm -rf etc home/.hammerspoon home/.ideavimrc home/.tmux.conf
rm -rf home/.config/alacritty home/.config/karabiner home/.config/kitty home/.config/pgcli


if [[ -z $STOW_FOLDERS ]]; then
  STOW_FOLDERS="home"
fi

if [[ -z $DOTPATH ]]; then
  DOTPATH=$HOME/src/dotfiles
fi

pushd "$DOTPATH"
for folder in "$(echo "$STOW_FOLDERS" | sed "s/,/ /g")"; do
  stow -R $folder -t $HOME
done
popd

cat <<EOS > ~/.gitconfig.local
[user]
	name = soshi morita
	email = moritasoushi@gmail.com
EOS
