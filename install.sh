# absolute path of this script
source_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"

app_install() {
    #:Updation and upgradation
    echo "Welcome, Upgrading and Updating your System ..."
    sudo apt-get update
    sudo apt-get upgrade

    #Frequently used apps
    local apps=('zsh' 'curl' 'wget' 'vlc' 'build-essential' 'gcc' 'g++' 'synaptic' 'gnome-tweaks')

    for i in "${apps[@]}"; do
        echo "Installing $i"
        sudo apt-get -y install "$i"
    done

    #installing oh-my-zsh
    curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

    echo "Setting up zshrc, bashrc and vimrc "
    mv .zshrc ~/.zshrc.old
    mv .bashrc ~/.bashrc.old
    ln -s $source_path/.zshrc ~/
    ln -s $source_path/.bashrc ~/
    echo "Note : Old configuration in ~/.zshrc.old and ~/.bashrc.old"
}

#invoke install function
app_install

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

