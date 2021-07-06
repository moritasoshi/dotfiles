#!/bin/bash

# 未定義な変数があったら途中で終了する
set -u

DOTPATH=~/dotfiles/home

chmod 700 $DOTPATH/*
cd $DOTPATH || exit

# ドットファイルを列挙（.??*）して ln を実行
for f in .??*; do
    [ "$f" = ".git" ] && continue
    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done
