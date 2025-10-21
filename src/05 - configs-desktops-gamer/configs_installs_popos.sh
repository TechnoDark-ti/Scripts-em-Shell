#!/bin/bash

sudo apt update && sudo apt upgrade -y

pop-upgrade release update
pop-upgrade release update



sudo apt install steam steam:i386 -y

sudo apt install flatpak

flatpak install flatpak install flathub com.heroicgameslauncher.hgl -y
flatpak install flatpak install flathub net.davidotek.pupgui2 -y
