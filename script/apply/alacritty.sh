#!/bin/bash
# OS別の設定ファイルをリンク

if [ "$(uname)" == "Darwin" ]; then
  # macOS
  rsync --no-perms -ah ~/src/dotfiles/xdg/config/alacritty/macos_config.toml ~/.config/alacritty/os_specific.toml
  echo "~/.config/alacritty/macos_config.toml synced"
else
  # Linux
  rsync --no-perms -ah ~/src/dotfiles/xdg/config/alacritty/linux_config.toml ~/.config/alacritty/os_specific.toml
  echo "~/.config/alacritty/linux_config.toml synced"
fi

