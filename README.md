# dotfiles

## Contents

- Alacritty
- Neovim
- fish shell
- tmux
- SDKman(for java development)
- mise(for other languages)

## Setup

```bash
eval "$(wget -qO- https://raw.githubusercontent.com/moritasoshi/dotfiles/refs/heads/main/boot.sh)"
```

## Application Configurations

### fish

Change your login shell to fish.

If you are in the `bash/zsh` session, then

```bash
chsh -s $(which fish)
```

If you are in the `fish` session, then

```fish
chsh -s (command -s fish)
```

## Font Resources

- [Cascadia Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaMono)
- [JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
