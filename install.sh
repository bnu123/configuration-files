#:Updation and upgradation
sudo apt-get -y update
sudo apt-get -y upgrade

#:Set up Softwares(apps) that you use.
sudo apt-get -y install zsh
sudo apt-get -y install curl
sudo apt-get -y install wget
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sudo apt-get -y install vlc

#Setting up zshrc,bashrc,vimrc,

source_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"


# TODO:setting up usr-commands


# TODO:Set up wallpaper, theme (download and apply it).











