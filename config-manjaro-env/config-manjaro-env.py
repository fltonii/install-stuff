import os

ext = open("./vscode-extensions.txt", "r").readlines()
for it in ext:
  os.system(f"code --install-extension {it}")
