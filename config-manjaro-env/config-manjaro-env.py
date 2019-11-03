import os
import urllib.request

file = urllib.request.urlopen("https://raw.githubusercontent.com/fltonii/scripts/master/config-manjaro-env/vscode-extensions.txt")
ext = file.readlines()
for it in ext:
  os.system(f"code --install-extension {it}")
