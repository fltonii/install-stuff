#!/usr/bin/env bash
sudo pacman -Syu --noconfirm
sudo pacman -Sy --noconfirm python3
python ../install-from-csv.py
