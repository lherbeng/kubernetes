#!/bin/bash

# 1.1 Master Node Configuration Files

echo "1.1.1 Ensure that the API server pod specification file permissions are set to 644 or more restrictive (Automated)"

permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/kube-apiserver.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.2 Ensure that the API server pod specification file ownership is set to root:root (Automated)"
ownership=$(stat -c %U:%G /var/lib/rancher/rke2/agent/pod-manifests/kube-apiserver.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.3 Ensure that the controller manager pod specification file permissions are set to 644 or more restrictive (Automated)"

permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/kube-controller-manager.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.4 Ensure that the controller manager pod specification file ownership is set to root:root (Automated)"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/agent/pod-manifests/kube-controller-manager.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi


