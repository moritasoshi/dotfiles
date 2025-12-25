xdg_configs=$(ls ~/src/dotfiles/xdg/config)

for app in $xdg_configs; do
  rsync --no-perms -ah ~/src/dotfiles/xdg/config/$app ~/.config/
  echo "~/.config/$app synced"
done
