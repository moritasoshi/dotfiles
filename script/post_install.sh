if command -v mise &>/dev/null; then
  mise install
  mise completion fish >~/.config/fish/completions/mise.fish
fi
