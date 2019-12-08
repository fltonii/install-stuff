#!/usr/bin/env bash

readonly VSCODE_CONFIG=~/.config/Code/User

#install prerequisites
sudo pacman -Syu --noconfirm
sudo pacman -Sy --noconfirm python3
sudo pacman -Sy --noconfirm yay

python ./install-from-csv.py

# setup git
git config --global user.name "fltonii"
git config --global user.email "tonialjoao97@gmail.com"

# setup vscode
python vscode/install-vscode-extensions.py
cp vscode/settings.json $VSCODE_CONFIG 
cp vscode/keybindings.json $VSCODE_CONFIG
