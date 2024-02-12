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

# Create RKE2 config Directory
mkdir -p /etc/rancher/rke2/

# Create config.yaml file for RKE2 agent
vi /etc/rancher/rke2/config.yaml
server:https//RKE2_SERVER_IP_ADDRESS:9345
token:TOKEN_FROM_RKE2_SERVER
