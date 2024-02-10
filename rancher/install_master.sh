


# Create RKE2 Directory
mkdir -p /etc/rancher/rke2/

#

#

cat << EOF >> /etc/rancher/rke2/config.yaml
token: rke2SecurePassword
EOF
