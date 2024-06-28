if ! fc-list : family | grep "JetBrainsMono Nerd Font" &>/dev/null; then
  sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd
fi

if ! fc-list : family | grep "CaskaydiaMono Nerd Font" &>/dev/null; then
  sudo pacman -S --noconfirm ttf-cascadia-mono-nerd
fi
