#!/bin/bash

# Set your desired RKE2 and Helm versions
RKE2_VERSION="v1.22.2+rke2r1"
HELM_VERSION="v3.7.0"

# Install RKE2
curl -sfL https://get.rke2.io | sh -
export PATH=$PATH:/var/lib/rancher/rke2/bin

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod +x get_helm.sh
./get_helm.sh --version $HELM_VERSION

# Initialize Helm
helm init --client-only

# Create a Kubernetes namespace for RKE2 and Helm releases
kubectl create namespace rke2

# Install RKE2 using Helm
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm install rke2 rancher-stable/rke2 \
  --namespace rke2 \
  --set rke2Server.image.tag=$RKE2_VERSION \
  --set rke2Server.config.mtu=1440 \
  --set rke2Server.config.flannel_backend=wireguard

# Wait for RKE2 server to become ready
kubectl wait --for=condition=Available deployment.apps/rke2-server -n rke2 --timeout=300s

# Output the kubeconfig file for future use
cp /etc/rancher/rke2/rke2.yaml $HOME/.kube/config
chmod 600 $HOME/.kube/config

echo "RKE2 and Helm installed successfully!"
