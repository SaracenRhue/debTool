#!/bin/bash

# curUsr=$(whoami)

update () {
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt autoremove -y
}

enable_root () {
    echo "enabling root user, enter new password"
    sudo passwd root
    echo "type 'su' to switch to root user"
}

i_anonsurf () {
    git clone https://github.com/Und3rf10w/kali-anonsurf.git
    cd kali-anonsurf
    chmod +x installer.sh
    sudo ./installer.sh
    cd
    sudo rm -fr kali-anonsurf
}

repos () {
    sudo apt install software-properties-common apt-transport-https curl -y
    sudo curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
}

i_zoom () {
    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install ./zoom_amd64.deb
    sudo rm -fr zoom_amd64.deb
}

aliases () {
    echo "alias python=python3" >> ~/.zshrc
    echo "alias python=python3" >> /../home/saracen/.zshrc
    echo "alias u='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt autoremove -y'" >> ~/.zshrc
    echo "alias u='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt autoremove -y'" >> /../home/saracen/.zshrc
    echo "alias i='sudo apt install'" >> ~/.zshrc
    echo "alias i='sudo apt install'" >> /../home/saracen/.zshrc
    echo "alias r='sudo apt remove'" >> ~/.zshrc
    echo "alias r='sudo apt remove'" >> /../home/saracen/.zshrc
    echo "alias s='apt search'" >> ~/.zshrc
    echo "alias s='apt search'" >> /../home/saracen/.zshrc
    echo "neofetch" >> ~/.zshrc
    echo "neofetch" >> /../home/saracen/.zshrc
    source >> ~/.zshrc
    source >> /../home/saracen/.zshrc

    echo "done..."
}

quit () {
    sudo apt autoremove -y 
    exit
}

r_packages(){
    PKGS=(
    'yelp'
    'python'
    'firefox-esr'
    'chromium'
    'totem'
    'nano'
    )

    for PKG in "${PKGS[@]}"; do
        sudo apt remove $PKG -y
    done

    sudo apt autoremove -y
}

i_packages() {
    PKGS=(
    'wget'
    'vim'
    'arc'
    'tor'
    'gparted'
    'htop'
    'neofetch'
    'net-tools'
    'nextcloud-desktop'
    'terminator'
    'thunderbird'
    'timeshift'
    'celluloid'
    'tree'
    'nodejs'
    'npm'
    'python3'
    'pip'
    'zsh'
    'zsh-autosuggestions'
    'zsh-syntax-highlighting'
    'gnome-tweaks'
    'gnome-shell-extensions'
    'krusader'
    'brave-browser'
    'code'
    )

    for PKG in "${PKGS[@]}"; do
        sudo apt install $PKG -y
    done
}

default_zsh() {
    chsh -s $(which zsh)
}

i_pip_mods(){
    PKGS=(
    'eel'
    'pyenv'
    'numpy'
    'openpyxl'
    'requests'
    'selenium'
    'pyautogui'
    'beautifulsoup4'
    )

    for PKG in "${PKGS[@]}"; do
        pip install $PKG
    done
}

while :
do
    clear
    cat<<EOF
    Please enter your choice:

     (1) full setup
     (0) quit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
        "1") enable_root
             update
             repos
             update
             i_packages
             r_packages
             i_anonsurf
             i_zoom
            # aliases
             default_zsh
             i_pip_mods
             ;;
        "0") quit && break ;;
     * )  echo "invalid option" ;;
    esac
    sleep 1
done
