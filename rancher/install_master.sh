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
curl -sfL https://get.rke2.io | sh -

# Enable and start RKE2 Server service
systemctl enable rke2-server.service
systemctl start rke2-server.service
