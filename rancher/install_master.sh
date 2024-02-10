#!/bin/bash

# Generate a random token
RKE2_TOKEN=$(openssl rand -base64 32)

# Create RKE2 Directory
mkdir -p /etc/rancher/rke2/

# Create or overwrite the RKE2 configuration file with the generated token

cat << EOF > /etc/rancher/rke2/config.yaml
token: $RKE2_TOKEN
EOF
