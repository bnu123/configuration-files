# absolute path of this script
source_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"

app_install() {
    #:Updation and upgradation
    echo "Welcome, Updating your system"
    sudo apt-get update
    sudo apt-get upgrade

    #Frequently used apps
    local apps=('zsh' 'vim' 'curl' 'wget' 'vlc' 'build-essential' 'gcc' 'g++' 'synaptic' 'gnome-tweaks' 'software-properties-common' 'apt-transport-https')

    for i in "${apps[@]}"; do
        echo "Installing $i"
        sudo apt-get -y install "$i"
    done

    #installing oh-my-zsh
    echo "Installing oh-my-zsh"
    curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

    echo "Setting up zshrc, bashrc and vimrc "
    mv ~/.zshrc ~/.zshrc.old
    mv ~/.bashrc ~/.bashrc.old
    ln -s $source_path/.zshrc ~/
    ln -s $source_path/.bashrc ~/
    echo "Note : Old configuration in ~/.zshrc.old and ~/.bashrc.old"
}

configure_editor() {
    #implementation due
    echo "Copying vscode settings to $HOME/.config/Code/User/"
    # Symbolic link is preferred though not tested so simple copying is done with
    # minimum configuration settings for vscode
    mv $HOME/.config/Code/User/settings.json $HOME/.config/Code/User/settings.old
    cp ./vs_settings/settings.json $HOME/.config/Code/User/settings.json
    mv $HOME/.config/Code/User/keybindings.json $HOME/.config/Code/User/keybindings.json
    echo "Settings Copied"
}

WIPdev_configure(){
    #Due to highly unstable nature, previous implementation was removed.
}

usr_commands(){
    #:setting up usr-commands
    echo "User commands setup"
    echo "Changing owner of /usr/local/bin"
    sudo chown -R $USER:$USER /usr/local/bin
    echo "Owner of bin successfully changed"

    ln -s $source_path/usr-commands/crnch /usr/local/bin/crnch
    ln -s $source_path/usr-commands/fastcpp /usr/local/bin/fastcpp
    ln -s $source_path/usr-commands/hub /usr/local/bin/hub
    ln -s $source_path/fpp.txt /usr/local/bin/fpp.txt
}

env_configure(){
    echo "Downloading fonts..."
    source ./source_code_font.sh
    echo "Setting up fonts for terminal and Desktop..."
    gsettings set org.gnome.desktop.wm.preference titlebar-font 'Source Code Pro Medium 11'
    gsettings set org.gnome.desktop.interface font-name 'Source Code Pro Heavy 12'
    gsettings set org.gnome.desktop.interface document-font-name 'Source Code Pro Medium 11'
    gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro Medium 13'
    echo "Fonts configuration complete"
}

app_install #install the apps
env_configure #Configure environment (Fonts,Themes etc)
#dev_configure #Configure your development environment

