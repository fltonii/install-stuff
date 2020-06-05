#!/usr/bin/env bash
DIR="$(dirname "$(which "$0")")"

readonly VSCODE_CONFIG=~/.config/Code/User
readonly VSCODE_DIR=$DIR/vscode

#install prerequisites
sudo pacman -Syu --noconfirm
sudo pacman -Sy --noconfirm python3
sudo pacman -Sy --noconfirm yay

python ./install-from-csv.py

# setup git
git config --global user.name "fltonii"
git config --global user.email "tonialjoao97@gmail.com"

# setup vscode
cp $VSCODE_DIR/settings.json $VSCODE_CONFIG 
cp $VSCODE_DIR/keybindings.json $VSCODE_CONFIG

# install vscode extensions
$VSCODE_DIR/install-extensions.sh