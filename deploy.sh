#!/bin/bash

# ディレクトリ定義と権限付与
WORK_DIR=$(cd $(dirname $0); pwd)
DOTPATH=$WORK_DIR/home
BINPATH=$WORK_DIR/home/bin

chmod 700 "$DOTPATH"/*
chmod 755 "$BINPATH"/*

cd "$DOTPATH" || exit

# ドットファイルを列挙（.??*）して ln を実行
for f in .??*; do
    [ "$f" = ".git" ] && continue
    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done
ln -snfv "$DOTPATH/.vimrc" "$HOME/.config/nvim/init.vim"

cd "$BINPATH" || exit

# binファイルを列挙（.??*）して ln を実行
files=$(ls)
for f in $files; do
    [ "$f" = ".git" ] && continue
    ln -snfv "$BINPATH/$f" "$HOME"/bin/"$f"
done
