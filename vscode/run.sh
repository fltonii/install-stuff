curl -s ./script.py https://raw.githubusercontent.com/fltonii/scripts/master/vscode/install-vscode-extensions.py | bash -s
cd ~/.config/Code/User
curl https://raw.githubusercontent.com/fltonii/scripts/master/vscode/settings.json --output settings.json
curl https://raw.githubusercontent.com/fltonii/scripts/master/vscode/keybindings.json --output keybindings.json
cd -1
