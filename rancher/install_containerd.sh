#!/bin/bash

# Update the package list and install prerequisites
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add the Docker APT repository and GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install containerd
sudo apt update
sudo apt install -y containerd.io

# Create the containerd configuration directory and file
sudo mkdir -p /etc/containerd
sudo containerd config default > /etc/containerd/config.toml

# Restart containerd to apply the configuration
sudo systemctl restart containerd

# Verify the installation
containerd --version
