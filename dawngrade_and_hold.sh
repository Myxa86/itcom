#!/usr/bin/env bash

sudo apt-mark hold linux-headers* \
    linux-hwe* \
    linux-image* \
    linux-modules*
sudo sed -i 's/GRUB_DEFAULT=0/GRUB_DEFAULT="1>2"/g' /etc/default/grub
sudo update-grub
