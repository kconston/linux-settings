while getopts e:f: flag
do
    case "${flag}" in
        e) email=${OPTARG};;
        f) fullname=${OPTARG};;
    esac
done

#Generate SSH
ssh-keygen -t ed25519 -C "$email"
eval `ssh-agent -s`
#   what if the file exists already?
sshFile=`sudo find ~/.ssh -name 'gh_du*' '!' -name '*.pub'`
sshFile=basename $sshFile
ssh-add ~/.ssh/$sshFile

#Install git
sudo apt install git
git config --global user.email "$email"
git config --global user.name "$fullname" 
#Install zsh
sudo apt install zsh
#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#Install cmake
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

#Install neovim nightly
git clone https://github.com/neovim/neovim.git $HOME/neovim
cd $HOME/neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
mkdir $HOME/.local/bin/
export PATH="$HOME/.local/:$PATH"
cp $HOME/linux-settings/scripts/nv.sh $HOME/.local/bin/nv.sh
chmod u+x $HOME/.local/bin/nv.sh
