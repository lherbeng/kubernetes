#!/bin/bash

# Stop Firewall
systemctl disable --now ufw

# Run updates and upgrade and install packages
apt update
apt install nfs-common open-iscsi -y
apt upgrade -y

# Automatic removal of unnecessary packages
apt autoremove -y

# Install RKE2 server
curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE=server sh -

# For specific RKE2 Server version
# curl -sfL https://get.rke2.io | INSTALL_RKE2_CHANNEL=v1.26 INSTALL_RKE2_TYPE=server sh -

# Enable and start RKE2 Server service
systemctl enable rke2-server.service
systemctl start rke2-server.service

# Check if RKE2 Service is running
systemctl status rke2-server.service

# Simlink all the things - kubectl
# ln -s $(find /var/lib/rancher/rke2/data -name kubectl) /usr/local/bin/kubectl
sudo ln -s /var/lib/rancher/rke2/data/v1.28.12-rke2r1-aa38cd526ddb/bin/kubectl /usr/local/bin/kubectl

# Add kubectl conf
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml

# check if kubectl works
kubectl get node -o wide

# Get server IP address Of RKE2 Server
ipaddr | grep inet

# Get Server token and copy it somwhere
cat /var/lib/rancher/rke2/server/node-token
