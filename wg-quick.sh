sudo apt update
sudo apt install wireguard -y
sudo cp ~/Downloads/*conf /etc/wireguard/wg0.conf
sudo systemctl enable --now wg-quick@wg0.service
sudo systemctl status wg-quick@wg0.service
