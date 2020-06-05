#!/usr/bin/env bash
DIR="$(dirname "$(which "$0")")"

readonly VSCODE_EXTENSIONS=$DIR/extensions.txt

# install vscode extensions 

echo $PATH
while read extension; do
	code --install-extension $extension
done < $VSCODE_EXTENSIONS
