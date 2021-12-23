#!/bin/bash

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="home,monex"
fi

if [[ -z $DOTPATH ]]; then
    DOTPATH=$HOME/src/dotfiles
fi

pushd $DOTPATH
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    stow -R $folder -t $HOME
done
popd