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

install_and_config_git() {
  if pacman -Qs git > /dev/null ; then
    echo "git already installed"
  else
    yay -Sy git
  fi
  
  read -p "git username: " name
  read -p "git email: " email


  git config --global user.email $email
  git config --global user.name $name

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
  if yay -Qs spotify-dev > /dev/null ; then
    echo "spotify already installed"
  else
    yay -Sy spotify-dev
  fi
}

install_zsh() {
  if yay -Qs zsh > /dev/null ; then
    echo "zsh already installed"
  else
    yay -Sy zsh && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
}

install_slack() {
  if yay -Qs slack-desktop > /dev/null ; then
    echo "slack already installed"
  else
    yay -Sy slack-desktop
  fi
}


install_discord() {
  if yay -Qs discord-canary > /dev/null ; then
    echo "discord already installed"
  else
    yay -Sy discord-canary
  fi
}

install_flutter() {
  if flutter --version > /dev/null ; then
    echo "flutter already installed"
  else
    mkdir ~/flutter
    cd ~/flutter
    curl -o ~/flutter/flutter_source.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.9.1+hotfix.6-stable.tar.xz && \
    tar xf flutter_source.tar.xz && \
    echo "PATH=$PATH:~/flutter/flutter/bin" >> ~/.zshrc 
    cd -
  fi
}

install_vscode_extensions() {
  curl -o ./script.py https://raw.githubusercontent.com/fltonii/scripts/master/config-manjaro-env/config-manjaro-env.py
  python script.py 
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
  install_and_config_git
  install_spotify
  install_slack
  install_discord
  install_flutter
  install_vscode_extensions
  cleanup
} || {
cleanup
}
