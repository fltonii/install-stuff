#!/usr/bin/env bash
sudo pacman -Syu --noconfirm

if pacman -Qs python3 > /dev/null ; then
  	echo "=== python3 already installed ==="
else
  	sudo pacman -Sy --noconfirm python3
fi

if pacman -Qs yay > /dev/null ; then
	echo "=== yay already installed ==="
else
	sudo pacman -Sy --noconfirm yay
fi

python ./install-from-csv.py
