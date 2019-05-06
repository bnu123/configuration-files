# absolute path of this script
source_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"

app_install() {
    #:Updation and upgradation
    echo "Welcome, Upgrading and Updating your System ..."
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
    mv .zshrc ~/.zshrc.old
    mv .bashrc ~/.bashrc.old
    ln -s $source_path/.zshrc ~/
    ln -s $source_path/.bashrc ~/
    echo "Note : Old configuration in ~/.zshrc.old and ~/.bashrc.old"
}

configure_editor() {
    #implementation due
}

dev_configure() {
#Editor==============================
    echo "Setting up Development environment"

    #installing vscode
    echo "Downloading vscode"

    #importing Microsoft GPG key
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

    #enable VsCode Repo
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt-get -y install code

    #configure_editor with extensions and editor settings
    configure_editor
}

usr_commands(){
    #:setting up usr-commands
    echo "User commands setup"
    ln -s $source_path/usr-commands/crnch /usr/local/bin/crnch
    ln -s $source_path/usr-commands/fastcpp /usr/local/bin/fastcpp
    ln -s $source_path/usr-commands/hub /usr/local/bin/hub
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
dev_configure #Configure your development environment
env_configre #Configure environment (Fonts,Themes etc)
