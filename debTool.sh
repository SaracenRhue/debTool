#!/bin/bash

# curUsr=$(whoami)

update () {
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt autoremove -y
}

u_python () {
    sudo apt install python3 -y
    sudo apt install pip -y
}

enable_root () {
    echo "enabling root user, enter new password"
    sudo passwd root
    echo "type 'su' to switch to root user"
}


i_anonsurf () {
    sudo apt install tor -y
    git clone https://github.com/Und3rf10w/kali-anonsurf.git
    cd kali-anonsurf
    chmod +x installer.sh
    sudo ./installer.sh
    cd
    sudo rm -fr kali-anonsurf
}
i_brave () {
    sudo apt install apt-transport-https curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update -y
    sudo apt install brave-browser -y
    echo "remove firefox?"
    sudo apt remove firefox-esr 
    sudo apt remove chromium -y
    sudo apt autoremove -y
}
i_gnome_boxes () { sudo apt install gnome-boxes -y; }
i_gparted () { sudo apt install gparted -y; }
i_neofetch () {
    sudo apt install neofetch -y
    echo "neofetch" >> ~/.zshrc
    echo "neofetch" >> /../home/saracen/.zshrc
}
i_net-tools () { sudo apt install net-tools -y; }
i_nextcloud () { sudo apt install nextcloud-desktop -y; }
i_tor () { sudo apt install tor -y; }
i_terminator () { sudo apt install terminator -y; }
i_thunderbird () { sudo apt install thunderbird -y; }
i_timeshift () { sudo apt install timeshift -y; }
i_tree () { sudo apt install tree -y; }
i_vlc () { sudo apt install vlc -y; }
i_vs-code () {
    sudo apt update -y
    sudo apt install software-properties-common apt-transport-https curl -y
    sudo curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update -y
    sudo apt install code -y
    sudo apt autoremove -y
}
i_zoom () {
    sudo apt update -y
    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install ./zoom_amd64.deb
    sudo rm -fr zoom_amd64.deb
}

i_node () {
    sudo apt install nodejs -y
    sudo apt install npm -y
}

i_current_py () {
    sudo apt remove python2 -y
    sudo apt install python3 -y
    sudo apt install pip -y
    echo "alias python=python3" >> ~/.zshrc
    echo "alias python=python3" >> /../home/saracen/.zshrc
}

aliases () {
    echo "alias u='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt autoremove -y'" >> ~/.zshrc
    echo "alias u='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt autoremove -y'" >> /../home/saracen/.zshrc
    echo "alias i='sudo apt install'" >> ~/.zshrc
    echo "alias i='sudo apt install'" >> /../home/saracen/.zshrc
    echo "alias r='sudo apt remove'" >> ~/.zshrc
    echo "alias r='sudo apt remove'" >> /../home/saracen/.zshrc
    echo "alias s='apt search'" >> ~/.zshrc
    echo "alias s='apt search'" >> /../home/saracen/.zshrc
    echo "alias tool='sudo bash debTool.sh'" >> ~/.zshrc
    echo "alias tool='sudo bash debTool.sh'" >> /../home/saracen/.zshrc
    echo "done..."
}

i_theme-tweaks () {
    sudo apt install gnome-tools -y
    sudo apt install gnome-shell-extensions -y
    sudo apt install gnome-chrome-shell -y
    mkdir .themes
}

quit () {
    sudo apt autoremove -y 
    exit
}

while :
do
    clear
    cat<<EOF
    Please enter your choice:

     (1) full setup
     (2) enable root
     (3) update everything
     (4) update python
     (a) inst anonsurf
     (b) inst brave
     (c) inst g-boxes
     (d) inst gparted
     (e) inst neofetch
     (f) inst net-tools
     (g) inst nextcloud
     (h) inst terminator
     (i) inst tor
     (j) inst timeshift
     (k) inst thunderbird
     (l) inst tree
     (m) inst vlc
     (n) inst vs-code
     (o) inst node/npm
     (7) int theme tweak dependencies
     (8) inst py3 rm py2
     (9) set aliases
     (0) quit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
        "1") enable_root
             update
             u_python
             i_anonsurf
             i_brave
             i_gnome_boxes
             i_gparted
             i_neofetch
             i_net-tools
             i_nextcloud
             i_terminator
             i_tor
             i_timeshift
             i_thunderbird
             i_tree
             i_vlc
             i_vs-code
             i_zoom
             i_node
             i_theme-tweaks
             current_py
             aliases 
             ;;
        "2") enable_root ;;
        "3") update ;;
        "4") u_python ;;
        "a") i_anonsurf ;;
        "b") i_brave ;;
        "c") i_gnome_boxes ;;
        "d") i_gparted ;;
        "e") i_neofetch ;;
        "f") i_net-tools ;;
        "g") i_nextcloud ;;
        "h") i_terminator ;;
        "i") i_tor ;;
        "j") i_timeshift ;;
        "k") i_thunderbird ;;
        "l") i_tree ;;
        "m") i_vlc ;;
        "n") i_vs-code ;;
        "o") i_zoom ;;
        "p") i_node ;;
        "7") i_theam-tweaks ;;
        "8") i_current_py ;;
        "9") aliases ;;
        "0") quit && break ;;
     * )  echo "invalid option" ;;
    esac
    sleep 1
done

#htop