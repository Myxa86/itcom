#swap
echo Enter size of SWAP in gb
read size_swap
fallocate -l ${size_swap}g /swapfile
chmod 600 /swapfile
mkswap /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

#install Chrome Ubuntu
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

#install Anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list

apt purge thunderbird -y

apt update
apt install google-chrome-stable -y
apt install anydesk -y
apt install slack-desktop -y
apt install telegram -y

#install kernel
core=5.13
version=5.13.0-39
apt install linux-modules-${version}-generic
apt install linux-hwe-${core}-headers-${version}
apt install linux-image-${version}-generic
apt install linux-modules-extra-${version}-generic
apt install linux-headers-${version}-generic

#hold kernels 
apt-mark hold linux-generic* linux-image-generic* linux-headers-generic*

apt upgrade -y
