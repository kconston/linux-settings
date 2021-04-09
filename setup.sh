#!/bin/sh

while getopts "e:f:" opt;
do
    case $opt in
        e) email=$OPTARG;;
        f) fullname=$OPTARG;;
    esac
done

echo "Email value: $email"
echo "Full name value: $fullname"

#update
sudo apt update

#Generate SSH
if [ -f "$HOME/.ssh/id_ed25519" ]; then
  echo "SSH file already exists"
else
  cd $HOME/.ssh
  ssh-keygen -t ed25519 -C "$email"
fi

#Install git
if [ -x "$(command -v git)" ]; then  
  echo "GIT already installed"
else
  sudo apt install git
fi

#Update git
if [ ! -z ${email+x} ]; then
   echo "Setting user.email to $email"
   git config --global user.email "$email"
fi
if [ ! -z ${fullname+x} ]; then
   echo "Setting user.name to $fullname"
   git config --global user.name "$fullname" 
fi

#Install zsh
if [ -x "$(command -v zsh)" ]; then
  echo "ZSH already installed"
else
  sudo apt install zsh
fi

#Install oh-my-zsh
OHMYZSHDIR="$HOME/.oh-my-zsh/"
if [ ! -d "$OHMYZSHDIR" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  cd $HOME
  if [ -f "$HOME/.zshrc" ]; then
    mv $HOME/.zshrc $HOME/.zshrc.old
  fi
  ln -s $HOME/linux-settings/.zshrc $HOME/.zshrc
else 
  echo "Oh-my-zsh already installed"
fi

#Install powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "Powerlevel 10k already installed"
fi
  
if [ -f "$HOME/.p10k.zsh" ]; then
  mv ~/.p10k.zsh ~/.p10k.zsh.bak
fi
ln -s ~/linux-settings/.p10k.zsh ~/.p10k.zsh

#Install cmake
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

sudo apt build-essential

#Install neovim nightly
if [ ! -d "$HOME/neovim" ]; then
  git clone https://github.com/neovim/neovim.git $HOME/neovim
  cd $HOME/neovim
  make CMAKE_BUILD_TYPE=Release
  sudo make install
else
  echo "Neovim nightly already installed"
fi


if [ ! -d "$HOME/.local/bin/" ]; then
  mkdir -p $HOME/.local/bin/
else
  echo ".local/bin/ already exists"
fi

if [ ! -f "$HOME/.local/bin/nv.sh" ]; then
  ln -s $HOME/linux-settings/scripts/nv.sh $HOME/.local/bin/nv.sh
  #cp $HOME/linux-settings/scripts/nv.sh $HOME/.local/bin/nv.sh
  chmod u+x $HOME/.local/bin/nv.sh
else
  echo "neovim nightly already executable"
fi

#Install Pynvim
pip3 install pynvim

#Install Ranger
sudo apt install ranger

#Install RipGrep
sudo apt install ripgrep

#Install Vim-Plug
if [ ! -d "$HOME/.config/nvim/" ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  mkdir -p ~/.config/nvim
  ln -s ~/linux-settings/init.vim ~/.config/nvim/init.vim
  nv +PlugInstall +qall
else
  echo "Vim-Plug already installed"
fi

#Install tmux
sudo apt install tmux
cd $HOME 
if [ ! -d "$HOME/.tmux/" ]; then
  git clone https://github.com/gpakosz/.tmux.git
  ln -sf $HOME/.tmux/.tmux.conf
  ln -sf $HOME/linux-settings/.tmux.conf.local
else
  echo 'Tmux already installed'
fi

echo 'Done!'
