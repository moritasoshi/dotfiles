#!/bin/bash

set -e

WORK_DIR=$(cd "$(dirname "$0")"; pwd)

if [[ -z $DOTPATH ]]; then
  DOTPATH=$WORK_DIR
fi

pushd "$WORK_DIR"
stow -R home -t "$HOME"
popd
