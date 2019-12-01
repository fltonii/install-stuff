#!/usr/bin/env bash
sudo pacman -Syu --noconfirm

if pacman -Qs python3 > /dev/null ; then
  echo "python3 already installed"
else
  sudo pacman -Sy python3
fi
python ./install-from-csv.py
