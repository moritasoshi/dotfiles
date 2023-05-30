# dotfiles

## Contents

- alacritty
- fish
- neovim
- tmux

## Setup

```bash
cd ~/src
git clone git@github.com:moritasoshi/dotfiles.git
./bootstrap.sh -a

# for mac only
./script/brew.sh -i
```

## Application Configurations

### fish

To change your login shell to fish

#### for x86 arch

```
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

#### for ARM arch

```
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
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
