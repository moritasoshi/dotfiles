if [ "$(uname)" == "Darwin" ]; then
  rsync --no-perms -ah ~/src/dotfiles/home/.hammerspoon ~/
  echo "~/.hammerspoon synced"
fi
