#!/bin/bash

# Stop Firewall
systemctl disable --now ufw

# Run updates and upgrade and install packages
apt update
apt install nfs-common open-iscsi -y
apt upgrade -y

# Automatic removal of unnecessary packages
apt autoremove -y

# Install RKE2 agent
curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE=agent sh -

# 
