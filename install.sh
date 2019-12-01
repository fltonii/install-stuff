#!/usr/bin/env bash
sudo pacman -Syu
sudo pacman -Sy python3
python ./install-from-csv.py
