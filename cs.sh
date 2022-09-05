#!/usr/bin/env bash

sudo chmod +x falcon*.deb
sudo dpkg -i falcon*.deb
sudo /opt/CrowdStrike/falconctl -s --cid=6AD79E8D04394D818B3C62A2D281DF0E-7E --provisioning-token=F83297A2
sudo service falcon-sensor start
