# applications

set -e

# Dropbox
if [[ ! -d ~/Dropbox ]]; then
  sudo apt install -y nautilus-dropbox
  gtk-launch dropbox.desktop
fi

# Obsidian

if ! flatpak list | grep Obsidian &>/dev/null; then
  flatpak install flathub md.obsidian.Obsidian
  flatpak run md.obsidian.Obsidian
fi
