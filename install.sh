# absolute path of this script
source_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"

#:Updation and upgradation
echo "Welcome, Upgrading and Updating your System ..."
sudo apt-get update
sudo apt-get upgrade

echo "Frequent Use App Installation"
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
echo "Note : Old configuration in ~/.zshrc.old and ~/.bashrc.old"

#:setting up usr-commands
echo "User commands setup"
ln -s $source_path/usr-commands/crnch /usr/local/bin/crnch
ln -s $source_path/usr-commands/fastcpp /usr/local/bin/fastcpp
ln -s $source_path/usr-commands/hub /usr/local/bin/hub

# TODO: Sett up Preferences
    # TODO:Set up wallpaper, theme (download and apply it).

    # TODO:Set up Development environment

        # TODO: Set up nodejs, npm, nginx, Dockers
        # TODO: Set up vscode.

