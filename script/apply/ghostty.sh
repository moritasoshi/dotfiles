#!/bin/bash
# OS別の設定ファイルをリンク

if [ "$(uname)" == "Darwin" ]; then
  # macOS
  rsync --no-perms -ah ~/src/dotfiles/xdg/config/ghostty/macos_config ~/.config/ghostty/os_specific
  echo "~/.config/ghostty/macos_config synced"
else
  # Linux
  rsync --no-perms -ah ~/src/dotfiles/xdg/config/ghostty/linux_config ~/.config/ghostty/os_specific
  echo "~/.config/ghostty/linux_config synced"
fi
