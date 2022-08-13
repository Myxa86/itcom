#!/usr/bin/env bash

#swap
fallocate -l 32g /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

#install Chrome Ubuntu
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

#install Anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list

apt purge thunderbird -y

apt update

#install kernel
version=5.15.0-30
apt install linux-headers-${version}-generic linux-image-${version}-generic -y

#hold kernels 
apt-mark hold linux-*generic*

#wireguard gui
apt install wireguard resolvconf -y
#apt install wireguard git dh-autoreconf libglib2.0-dev intltool build-essential libgtk-3-dev libnma-dev libsecret-1-dev network-manager-dev resolvconf -y
#git clone https://github.com/max-moser/network-manager-wireguard
#cd network-manager-wireguard
#./autogen.sh --without-libnm-glib
#./configure --without-libnm-glib --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/NetworkManager --localstatedir=/var
#make && make install

#install soft
apt upgrade -y

apt install google-chrome-stable -y
apt install anydesk -y
apt install telegram-desktop -y
snap install slack --classic

apt autoremove -y
apt autoclean -y
