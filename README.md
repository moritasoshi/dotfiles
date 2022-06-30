# dotfiles

## Contents

- alacritty
- neovim
- tmux
- zsh

## Setup

```bash
cd ~/src
git clone git@github.com:moritasoshi/dotfiles.git 
./bootstrap.sh -a

# for mac only
./script/brew.sh -i
```


## Application Configurations

### tmux

To enable italics you will need to compile and install `xterm-256color-italic.terminfo`.

```
tic xterm-256color-italic.terminfo
```

## Other Configurations

## Font Resources

- [JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono)
- [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack)
