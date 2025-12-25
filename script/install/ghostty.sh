#!/bin/bash
# Install Ghostty on Linux

if ! command -v ghostty &>/dev/null; then
  echo "Installing Ghostty..."

  if command -v snap &>/dev/null; then
    sudo snap install ghostty
  elif command -v flatpak &>/dev/null; then
    flatpak install -y flathub org.ghostty.Ghostty
  else
    echo "Warning: No supported package manager found for Ghostty"
    echo "Please install manually: https://ghostty.org/docs/install/binary"
    exit 1
  fi
else
  echo "Ghostty already installed"
fi
