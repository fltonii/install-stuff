#!/usr/bin/env bash
sudo pacman -Syu --noconfirm
sudo pacman -Sy --noconfirm python3
mkdir temp1
cd temp1
python ./install-from-csv.py
cd -1 && rm -rf temp1
