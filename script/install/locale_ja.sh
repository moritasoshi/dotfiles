#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Uncomment the japanese locale
sudo sed -i "s/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/" /etc/locale.gen

# Generate locales
sudo locale-gen
