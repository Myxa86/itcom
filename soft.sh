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
core=5.13
version=5.13.0-51
apt install linux-modules-${version}-generic -y \
    linux-hwe-${core}-headers-${version} -y \
    linux-image-${version}-generic -y \
    linux-modules-extra-${version}-generic -y \
    linux-headers-${version}-generic -y

#hold kernels 
apt-mark hold linux-generic* \
    linux-image-generic* \
    linux-headers-generic*

#wireguard gui
apt install wireguard -y
#apt install wireguard git dh-autoreconf libglib2.0-dev intltool build-essential libgtk-3-dev libnma-dev libsecret-1-dev network-manager-dev resolvconf -y
#git clone https://github.com/max-moser/network-manager-wireguard
#cd network-manager-wireguard
#./autogen.sh --without-libnm-glib
#./configure --without-libnm-glib --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/NetworkManager --localstatedir=/var
#make && make install

#install soft
apt upgrade -y
apt install google-chrome-stable -y \
    anydesk -y \
    telegram-desktop -y
snap install slack --classic

apt autoremove -y
apt autoclean -y
