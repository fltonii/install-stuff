mkdir temp
cd temp
read -p "git username: " name
read -p "git email: " email

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

install_python3() {
  if yay -Qs python3 > /dev/null ; then
    echo "python3 already installed"
  else
    yay -Sy python3
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

install_and_config_git() {
  if pacman -Qs git > /dev/null ; then
    echo "git already installed"
  else
    yay -Sy git
  fi
  
  git config --global user.email "$email"
  git config --global user.name "$name"

  git config --global alias.ck checkout
  git config --global alias.br branch
  git config --global alias.unstage 'reset HEAD --'
  git config --global alias.last 'log -1 HEAD'
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

install_spotify() {
  snap install spotify
}

install_zsh() {
  if yay -Qs zsh > /dev/null ; then
    echo "zsh already installed"
  else
    yay -Sy zsh
  fi
}

install_oh_my_zsh() {  
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

cleanup() {
  cd ../
  rm -rf temp
}

{
  install_yay
  yay
  install_python3
  install_node
  install_yarn
  install_chrome
  install_vscode
  install_zsh
  install_oh_my_zsh
  install_and_config_git
  install_spotify
  cleanup
} || {
cleanup
}
