if ! command -v zellij &>/dev/null; then
  sudo pacman -S --noconfirm zellij
  mkdir -p ~/.config/zellij/
fi
