#!/bin/bash
# completely disable/uninstall snap on ubuntu 24.04 (ubuntu noble numbat) and install firefox from .deb only

sudo snap remove --purge firefox 
sudo snap remove --purge snap-store 
sudo snap remove --purge gnome-42-2204 
sudo snap remove --purge gtk-common-themes 
sudo snap remove --purge snapd-desktop-integration 
sudo snap remove --purge bare 
sudo snap remove --purge firmware-updater 
sudo snap remove --purge core22 
sudo snap remove --purge snapd

sudo apt remove --autoremove snapd

echo -e 'Package: snapd\nPin: release a=*\nPin-Priority: -10' | sudo tee /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt install --install-suggests gnome-software
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update
sudo apt install -t 'o=LP-PPA-mozillateam' firefox
sudo apt-mark hold flatpak
