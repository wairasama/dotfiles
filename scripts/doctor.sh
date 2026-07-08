#!/usr/bin/env bash

echo "===== Workstation Doctor ====="

echo
echo "Git:"
git --version

echo
echo "Homebrew:"
brew --version

echo
echo "Chezmoi:"
chezmoi --version

echo
echo "Mise:"
mise --version

echo
echo "Starship:"
starship --version

echo
echo "Kitty:"
kitty --version

echo
echo "Neovim:"
nvim --version | head -n 1
