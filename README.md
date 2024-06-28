# dotfiles

## Contents

- alacritty
- fish
- neovim
- tmux

## Setup

for Linux
```bash
cd ~/src
git clone git@github.com:moritasoshi/dotfiles.git
./linux-install.sh
```

for mac
```bash
cd ~/src
git clone git@github.com:moritasoshi/dotfiles.git
./bootstrap.sh -a
./script/brew.sh -i
```

## Application Configurations

### fish

Change your login shell to fish.

If you are in the `bash/zsh` session, then
```
chsh -s $(which fish)
```

If you are in the `fish` session, then
```
chsh -s (command -s fish)
```

### tmux

To enable italics you will need to compile and install `xterm-256color-italic.terminfo`.

```
tic xterm-256color-italic.terminfo
```

Install tpm plugins.

```
<Ctrl+Space> + I
```

## Other Configurations
```
# nodebrew
# You need to manually run setup_dirs to create directories required by nodebrew
/usr/local/opt/nodebrew/bin/nodebrew setup_dirs
```

## Font Resources

- [JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
