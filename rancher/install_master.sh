#!/bin/bash

# Stop Firewall
systemctl disable --now ufw

# Run updates and upgrade and install packages
apt update
apt install nfs-common open-iscsi -y
apt upgrade -y

# Automatic removal of unnecessary packages
apt autoremove -y

# Generate a random token
RKE2_TOKEN=$(openssl rand -base64 32)

# Create RKE2 Directory
mkdir -p /etc/rancher/rke2/

# Create or overwrite the RKE2 configuration file with the generated token

cat << EOF > /etc/rancher/rke2/config.yaml
token: $RKE2_TOKEN
EOF

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
ln -s $(find /var/lib/rancher/rke2/data -name kubectl) /usr/local/bin/kubectl

# Add kubectl conf
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml

# check if kubectl works
kubectl get node -o wide

# Get server IP address Of RKE2 Server
ipaddr | grep inet

# Get Server token and copy it somwhere
cat /var/lib/rancher/rke2/server/node-token
