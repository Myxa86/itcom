sudo apt-mark hold linux-headers*
sudo apt-mark hold linux-hwe*
sudo apt-mark hold linux-image*
sudo apt-mark hold linux-modules*
#sudo sed -i 's/GRUB_DEFAULT=0/GRUB_DEFAULT="1>2"/g' /etc/default/grub
sudo update-grub
