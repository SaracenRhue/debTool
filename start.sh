#!/bin/bash


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

bash_aliases () {
    echo "alias python=python3" >> ~/.bashrc
    echo "alias python=python3" >> /../home/saracen/.bashrc
    echo "alias u='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt autoremove -y'" >> ~/.bashrc
    echo "alias u='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt autoremove -y'" >> /../home/saracen/.bashrc
    echo "alias i='sudo apt install'" >> ~/.bashrc
    echo "alias i='sudo apt install'" >> /../home/saracen/.bashrc
    echo "alias r='sudo apt remove'" >> ~/.bashrc
    echo "alias r='sudo apt remove'" >> /../home/saracen/.bashrc
    echo "alias s='apt search'" >> ~/.bashrc
    echo "alias s='apt search'" >> /../home/saracen/.bashrc
    echo "neofetch" >> ~/.bashrc
    echo "neofetch" >> /../home/saracen/.bashrc
    source >> ~/.bashrc
    source >> /../home/saracen/.bashrc
    echo "done..."
}

zsh_aliases () {
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
#    source >> ~/.zshrc
#    source >> /../home/saracen/.zshrc
    echo "done..."
}

quit () {
    sudo apt autoremove -y 
    exit
}

r_gnome_packs(){
    PKGS=(
    'yelp'
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

basic_packages() {
    sudo apt remove python -y
    sudo apt install wget arc tor gparted htop neofetch net-tools nextcloud-desktop terminator thunderbird timeshift celluloid tree nodejs npm python3 pip krusader brave-browser code
}

default_zsh() {
    sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting -y
    chsh -s $(which zsh)
}


setup_virt_manager() {
    sudo apt install virt-manager qemu vde2 dnsmasq bridge-utils openbsd-netcat edk2-ovmf swtpmr iptables -y
    sudo systemctl enable libvirtd.service
    sudo systemctl start libvirtd.service
    sudo usermod -a -G libvirt $USER
}

while :
do
    clear
    cat<<EOF
    Please enter your choice:

     (1) basic packages
     (2) setup zsh
     (3) zsh aliases
     (4) bash aliases
     (0) quit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
        "1") enable_root
             update
             repos
             update
             basic_packages
             i_anonsurf
             i_zoom
             ;;
        "2") setup_zsh ;;
        "3") zsh_aliases ;;
        "4") bash_aliases ;;
        "0") quit && break ;;
     * )  echo "invalid option" ;;
    esac
    sleep 1
done
