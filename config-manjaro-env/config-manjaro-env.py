import os

ext = open("https://raw.githubusercontent.com/fltonii/scripts/master/config-manjaro-env/vscode-extensions.txt", "r").readlines()
for it in ext:
  os.system(f"code --install-extension {it}")
