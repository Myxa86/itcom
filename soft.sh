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
version=5.13.0-39
apt install linux-modules-${version}-generic -y
apt install linux-hwe-${core}-headers-${version} -y
apt install linux-image-${version}-generic -y
apt install linux-modules-extra-${version}-generic -y
apt install linux-headers-${version}-generic -y

#hold kernels 
apt-mark hold linux-generic* linux-image-generic* linux-headers-generic*

apt upgrade -y

apt install google-chrome-stable -y
apt install anydesk -y
apt install telegram-desktop -y
snap install slack --classic -y
