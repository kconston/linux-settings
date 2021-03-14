#!/bin/sh

while getopts e:f: flag
do
    case "${flag}" in
        e) email=${OPTARG};;
        f) fullname=${OPTARG};;
    esac
done

#Generate SSH
cd $HOME/.ssh
ssh-keygen -t ed25519 -C "$email"

#Update git
git config --global user.email "$email"
git config --global user.name "$fullname" 

#Install zsh
sudo apt install zsh

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd $HOME
mv $HOME/.zshrc $HOME/.zshrc.old
ln -s $HOME/linux-settings/.zshrc $HOME/.zshrc

#Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
mv ~/.p10k.zsh ~/.p10k.zsh.bak
ln -s ~/linux-settings/.p10k.zsh ~/.p10k.zsh

#Install cmake
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip build-essential

#Install neovim nightly
git clone https://github.com/neovim/neovim.git $HOME/neovim
cd $HOME/neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
mkdir -p $HOME/.local/bin/
zsh
ln -s $HOME/linux-settings/scripts/nv.sh $HOME/.local/bin/nv.sh
#cp $HOME/linux-settings/scripts/nv.sh $HOME/.local/bin/nv.sh
chmod u+x $HOME/.local/bin/nv.sh

#Install Ranger
sudo apt install ranger

#Install RipGrep
sudo apt install ripgrep

#Install Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
ln -s ~/linux-settings/init.vim ~/.config/nvim/init.vim
nv +PlugInstall +qall

#Install tmux
sudo apt install tmux
cd $HOME 
git clone https://github.com/gpakosz/.tmux.git
ln -sf $HOME/.tmux/.tmux.conf
ln -sf $HOME/linux-settings/.tmux.conf.local
