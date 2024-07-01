mkdir -p ~/.local/share/fonts &>/dev/null

if ! fc-list : family | grep "JetBrainsMono Nerd Font" &>/dev/null; then
  sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd
fi

if ! fc-list : family | grep "CaskaydiaMono Nerd Font" &>/dev/null; then
  cd /tmp
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
  unzip CascadiaMono.zip -d CascadiaFont
  cp CascadiaFont/*.ttf ~/.local/share/fonts
  rm -rf CascadiaMono.zip CascadiaFont
fi

if ! fc-list : family | grep "Noto Sans CJK JP" &>/dev/null; then
  cd /tmp
  wget -O NotoSerifCJKjp.zip https://github.com/notofonts/noto-cjk/releases/download/Serif2.002/07_NotoSerifCJKjp.zip
  unzip NotoSerifCJKjp.zip -d NotoSerifCJKjp
  cp NotoSerifCJKjp/*.otf ~/.local/share/fonts
  rm -rf NotoSerifCJKjp.zip NotoSerifCJKjp
fi

if ! fc-list : family | grep "SF Pro Text" &>/dev/null; then
  cd /tmp
  wget https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg
  7z x SF-Pro.dmg -o SF-Pro
  cp SF-Pro/*.otf SF-Pro/*.ttf ~/.local/share/fonts
  rm -rf SF-Pro.dmg SF-Pro
fi
