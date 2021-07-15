#!/bin/bash

# 未定義な変数があったら途中で終了する
set -u

# ディレクトリ定義と権限付与
DOTPATH=~/dotfiles/home
BINPATH=$DOTPATH/bin

chmod 700 $DOTPATH/*
chmod 755 $BINPATH/*

cd $DOTPATH || exit

# ドットファイルを列挙（.??*）して ln を実行
for f in .??*; do
    [ "$f" = ".git" ] && continue
    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

cd $BINPATH || exit

# binファイルを列挙（.??*）して ln を実行
files=$(ls)
for f in $files; do
    [ "$f" = ".git" ] && continue
    ln -snfv "$BINPATH/$f" "$HOME"/bin/"$f"
done
