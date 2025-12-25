DATA_HOME=${XDG_DATA_HOME:-~/.local/share}
SRC_DIR=~/src/dotfiles/xdg/data

xdg_data=$(ls "$SRC_DIR")

for app in $xdg_data; do
  rsync --no-perms -ah "$SRC_DIR/$app/" "$DATA_HOME/$app/"
  echo "$DATA_HOME/$app synced"
done
