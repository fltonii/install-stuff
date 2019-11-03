import os

def install_vscode_extensions():
  ext = open("./vscode-extensions.txt", "r").readlines()
  for it in ext:
    os.system(f"code --install-extension {it}")

os.system('sh ./config.sh')
install_vscode_extensions()