#swap
fallocate -l 32G /swapfile
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
apt install google-chrome-stable
apt install anydesk
apt install slack-desktop
apt install telegram

#hold kernels 
apt-mark hold linux-generic* linux-image-generic* linux-headers-generic*