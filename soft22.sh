#!/usr/bin/env bash

#swap
fallocate -l 32g /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

#hold kernels 
apt-mark hold linux-generic* linux-image-generic* linux-headers-generic*

#install soft
apt purge thunderbird -y

apt update
apt install google-chrome-stable -y \
    anydesk -y \
    telegram-desktop -y \
    wireguard -y \
    resolvconf -y
snap install slack --classic

apt upgrade -y
apt autoremove -y
apt autoclean -y
