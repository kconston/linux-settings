
current_dir=$(pwd)

mkdir $HOME/.virtualenvs


# {{ Update }}
sudo apt update

# {{ Install Curl }}
sudo apt install curl

# {{ Install wget }}
sudo apt install wget

while getopts "e:f:" opt;
do
    case $opt in
        e) email=$OPTARG;;
        f) fullname=$OPTARG;;
    esac
done

echo "Email value: $email"
echo "Full name value: $fullname"

# {{ Generate SSH }}
if [ -f "$HOME/.ssh/id_ed25519" ]; then
  echo "SSH file already exists"
else
  cd $HOME/.ssh
  ssh-keygen -t ed25519 -C "$email"
fi

# {{ Install git }}
if [ -x "$(command -v git)" ]; then  
  echo "GIT already installed"
else
  sudo apt install git
fi

# {{ Update git }}
if [ ! -z ${email+x} ]; then
   echo "Setting user.email to $email"
   git config --global user.email "$email"
fi
if [ ! -z ${fullname+x} ]; then
   echo "Setting user.name to $fullname"
   git config --global user.name "$fullname" 
fi

# {{ Install zsh }}
if [ -x "$(command -v zsh)" ]; then
  echo "ZSH already installed"
else
  sudo apt install zsh
fi

# {{ Install oh-my-zsh }}
OHMYZSHDIR="$HOME/.oh-my-zsh/"
if [ ! -d "$OHMYZSHDIR" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  cd $HOME
  if [ -f "$HOME/.zshrc" ]; then
    mv $HOME/.zshrc $HOME/.zshrc.old
  fi
  ln -s $HOME/git/linux-settings/.zshrc $HOME/.zshrc
else 
  echo "Oh-my-zsh already installed"
fi

# {{ ZSH Themes }}
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# {{ Install powerlevel10k }}
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "Powerlevel 10k already installed"
fi
if [ -f "$HOME/.p10k.zsh" ]; then
  mv $HOME/.p10k.zsh $HOME/.p10k.zsh.bak
fi
ln -s $HOME/git/linux-settings/.p10k.zsh $HOME/.p10k.zsh

# {{ Install cmake }}
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip 
sudo apt build-essential

# {{ Install taskwarrior }}
sudo apt install taskwarrior

# {{ Install neovim nightly }}
if [ ! -d "$HOME/git/neovim" ]; then
  git clone https://github.com/neovim/neovim.git $HOME/git/neovim
  cd $HOME/git/neovim
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
if [ ! -d "$HOME/.config/nvim" ]; then
  mkdir -p $HOME/.config/nvim
else
  echo ".config/nvim already exists"
fi

# {{ Create NVIM sym links }}
ln -s $HOME/git/linux-settings/init.lua $HOME/.config/nvim/init.lua
ln -s $HOME/git/linux-settings/lua $HOME/.config/nvim/lua          

# {{ Install Packer }}
#nvim --headless +PackerCompile +PackerSync
#nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# {{ Install RipGrep }}
sudo apt install ripgrep

# {{ Install Java }}
sudo apt install openjdk-11-jdk

# {{ Install Go }}
if [ ! -d "/usr/local/go" ]; then
  mkdir -p $HOME/Downloads/
  cd $HOME/Downloads/
  wget https://golang.org/dl/go1.16.3.linux-amd64.tar.gz
  sudo tar -xvf go1.16.3.linux-amd64.tar.gz -C /usr/local/
else
  echo "Go already installed"
fi

# {{ Install tmux }}
sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config
cd $HOME/git
if [ ! -d "$HOME/.tmux/" ]; then
  git clone https://github.com/tmux/tmux.git
  cd tmux
  sh autogen.sh
  ./configure
  make && sudo make install
  cd $HOME/git
  git clone https://github.com/gpakosz/.tmux.git
  ln -sf $HOME/.tmux/.tmux.conf
  ln -sf $HOME/linux-settings/.tmux.conf.local
else
  echo 'Tmux already installed'
fi

# {{ Install LazyGit }}
go get github.com/jesseduffield/lazygit

# {{ Install NVM }}
cd $HOME/git
git clone https://github.com/nvm-sh/nvm.git .nvm
cd .nvm
git checkout v0.38.0
. ./nvm.sh

# {{ Install Node }}
nvm install node
npm install -g neovim

# {{ Install dotnet }}
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update; \
  sudo apt install -y apt-transport-https && \
  sudo apt update && \
  sudo apt install -y dotnet-sdk-5.0

# {{ Install Omnisharp }}
mkdir ~/bin/omnisharp
curl -L -O "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.37.14/omnisharp-linux-x64.tar.gz" \
   && tar -xf omnisharp-linux-x64.tar.gz -C ~/bin/omnisharp \
   && rm omnisharp-linux-x64.tar.gz

# {{ Install Python 3.9 }}
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev
cd $HOME/Downloads
wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
tar -xf Python-3.9.1.tgz
cd Python-3.9.1
./configure --enable-optimizations
make -j 8
sudo make altinstall
sudo apt install python3-distutils

## {{ Install PyLint }}
python3.9 -m pip install pylint

## {{ Install Rope }}          
python3.9 -m pip install rope
                               
## {{ Install Jedi }}         
python3.9 -m pip install jedi

# {{ Install DirEnv }}
if ! command -v direnv &> /dev/null
then
  go get github.com/direnv/direnv/
else 
	echo 'DirEnv already installed'
fi

# {{ Install Poetry }}
if ! command -v poetry &> /dev/null 
then
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3.9 -
  cd $HOME/.local/bin
  ln -s $HOME/git/linux-settings/scripts/poetry-here poetry-here
else 
	echo 'Poetry already installed'
fi

# {{ Install Venv }}
sudo apt install python3-venv

# {{ Install Pynvim }}
cd $HOME/.virtualenvs
python3 -m venv nvim
cd nvim/bin
./pip3.7 install wheel
./pip3.7 install pynvim

# {{ Install Debugpy }}
cd $HOME/.virtualenvs
python3 -m venv debugpy
cd debupy/bin
./python -m pip install debugpy

# {{ Install NNN }}
sudo apt-get install pkg-config libncursesw5-dev libreadline-dev
cd $HOME/git
git clone git@github.com:jarun/nnn.git
cd nnn
sudo make strip install

# {{ Install Neofetch }}
sudo apt install neofetch

cd $HOME/git/linux-settings/
source .zshrc

cd $current_dir
echo 'Done!'
