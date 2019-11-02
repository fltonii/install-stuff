mkdir temp

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
  if pacman -Qs yarn > /dev/null ; then
    echo "yarn is already installed"
  else
    curl -o- -L https://yarnpkg.com/install.sh | bash
  fi
}

install_chrome() {
  if pacman -Qs google-chrome-dev > /dev/null ; then
    echo "chrome already installed"
  else
    yay -Sy --no-confirm google-chrome-dev
  fi
}

install_node() {
  if pacman -Qs nodejs > /dev/null ; then
    echo "nodejs already installed"
  else
    git clone https://github.com/nodejs/node.git node
    cd node
    ./configure
    make -j4
  fi
}

install_vscode() {
  if pacman -Qs visual-studio-code-bin > /dev/null ; then
    echo "vscode already installed"
  else
    yay -Sy --no-confirm visual-studio-code-bin
  fi
}

install_zsh() {
  yay -Sy zsh
  chsh -s /usr/bin/zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

cleanup() {
  cd ../
  rm -rf temp
}

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

pacman -Syu

install_yay
yay

install_node
install_yarn
install_chrome
install_vscode
install_zsh

cleanup
