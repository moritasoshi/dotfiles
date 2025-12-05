mkdir -p ~/Library/Fonts/ &>/dev/null

if ! fc-list : family | grep "CaskaydiaMono Nerd Font" &>/dev/null; then
  cd /tmp
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
  unzip CascadiaMono.zip -d CascadiaFont
  cp CascadiaFont/*.ttf ~/Library/Fonts
  rm -rf CascadiaMono.zip CascadiaFont
fi

if ! fc-list : family | grep "JetBrainsMono Nerd Font" &>/dev/null; then
  cd /tmp
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  unzip JetBrainsMono.zip -d JetBrainsMonoFont
  cp JetBrainsMonoFont/*.ttf ~/Library/Fonts
  rm -rf JetBrainsMono.zip JetBrainsMonoFont
fi
