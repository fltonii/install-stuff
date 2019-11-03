mkdir temp
cd temp

install_yay() {
  if pacman -Qs yay > /dev/null ; then
    echo "yay is already installed"
  else
    git clone https://aur.archlinux.org/yay.git yay
    cd yay
    makepkg -si
    cd ../
    rm -rf yay
  fi
}

install_yarn() {
  if yay -Qs yarn > /dev/null ; then
    echo "yarn is already installed"
  else
    yay -Sy yarn
  fi
}

install_chrome() {
  if yay -Qs google-chrome-dev > /dev/null ; then
    echo "chrome already installed"
  else
    yay -Sy google-chrome-dev
  fi
}

install_node() {
  if yay -Qs nodejs > /dev/null ; then
    echo "nodejs already installed"
  else
    yay -Sy nodejs
  fi
}

install_vscode() {
  if yay -Qs visual-studio-code-bin > /dev/null ; then
    echo "vscode already installed"
  else
    yay -Sy visual-studio-code-bin
  fi
}

install_zsh() {
  if yay -Qs zsh > /dev/null ; then
    echo "zsh already installed"
  else
    yay -Sy zsh
  fi
}

install_oh-my-zsh() {  
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

cleanup() {
  cd ../
  rm -rf temp
}

pacman -Syu

{
  install_yay
  yay
  install_node
  install_yarn
  install_chrome
  install_vscode
  install_zsh
  install_oh-my-zsh
  cleanup
} || {
cleanup
}
