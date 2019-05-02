# absolute path of this script
source_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"

#:Updation and upgradation
echo "Welcome, Upgrading and Updating your System ..."
sudo apt-get -y update
sudo apt-get -y upgrade

#:Set up Softwares(apps) that you use.
echo "Installing zsh"
sudo apt-get -y install zsh
echo "Installing curl"
sudo apt-get -y install curl
echo "Installing wget"
sudo apt-get -y install wget
echo "Installing oh-my-zsh"
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
echo "Installing vlc"
sudo apt-get -y install vlc
echo "Installing build-essential"
sudo apt-get -y install build-essential
echo "Installing gcc, g++ compilers"
sudo apt-get -y install gcc
sudo apt-get -y install g++
echo "Installing synaptic"
sudo apt-get -y install synaptic

echo "Setting up zshrc, bashrc and vimrc "
mv .zshrc ~/.zshrc.old
mv .bashrc ~/.bashrc.old
ln -s $source_path/.zshrc ~/
ln -s $source_path/.bashrc ~/
echo "Old configuration in ~/.zshrc.old and ~/.bashrc.old"

# TODO:setting up usr-commands
printf "User commands setup"
cp $source_path/usr-commands/crnch /usr/local/bin/crnch
cp $source_path/usr-commands/fastcpp /usr/local/bin/fastcpp

# TODO:Set up wallpaper, theme (download and apply it).

