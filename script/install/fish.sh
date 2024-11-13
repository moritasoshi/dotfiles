if ! command -v fish &>/dev/null; then
  sudo apt install -y fish
fi

# Install fisher if not already installed
if ! test -f "$HOME/.config/fish/functions/fisher.fish"; then
  fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
fi

# Install fisher plugins
fish -c "fisher install \
    reitzig/sdkman-for-fish"
