#!/usr/bin/env bash

sudo apt update
sudo apt install wireguard git dh-autoreconf libglib2.0-dev intltool build-essential libgtk-3-dev libnma-dev libsecret-1-dev network-manager-dev resolvconf -y
sudo git clone https://github.com/max-moser/network-manager-wireguard
cd network-manager-wireguard
sudo ./autogen.sh --without-libnm-glib
sudo ./configure --without-libnm-glib --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/NetworkManager --localstatedir=/var
sudo make
sudo make install
