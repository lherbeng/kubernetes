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

echo

echo "1.1.5 Ensure that the scheduler pod specification file permissions are set to 644 or more restrictive (Automated)"

permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/kube-scheduler.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.6 Ensure that the scheduler pod specification file ownership is set to root:root (Automated)"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/agent/pod-manifests/kube-scheduler.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.7 Ensure that the etcd pod specification file permissions are set to 644 or more restrictive (Automated)"

permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/etcd.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo 

echo "1.1.8 Ensure that the etcd pod specification file ownership is set to root:root (Automated)"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/agent/pod-manifests/etcd.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.9 Ensure that the Container Network Interface file permissions are set to 644 or more restrictive (Manual)"

permission=$(stat -c %a /var/lib/rancher/rke2/server/manifests/rke2-canal.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.10 Ensure that the Container Network Interface file ownership is set to root:root (Manual)"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/manifests/rke2-canal.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.11 Ensure that the etcd data directory permissions are set to 700 or more restrictive (Automated)"

permission=$(stat -c %a /var/lib/rancher/rke2/server/db/etcd)
if [ "$permission" != "700" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "700" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.12 Ensure that the etcd data directory ownership is set to etcd:etcd (Automated)"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/db/etcd)
if [ "$ownership" != "etcd:etcd" ]; then
    echo "Current ownership: $ownership. Result: Fail"
elif [ "$ownership" = "etcd:etcd" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.13 Ensure that the admin.conf file permissions are set to 644 or more restrictive (Automated)"

permission=$(stat -c %a /var/lib/rancher/rke2/server/cred/admin.kubeconfig)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.14 Ensure that the admin.conf file ownership is set to root:root (Automated)"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/cred/admin.kubeconfig)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.15 Ensure that the scheduler.conf file permissions are set to 644 or more restrictive (Automated)"

permission=$(stat -c %a /var/lib/rancher/rke2/server/cred/scheduler.kubeconfig)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.16 Ensure that the scheduler.conf file ownership is set to root:root (Automated)"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/cred/scheduler.kubeconfig)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.17 Ensure that the controller.kubeconfig file permissions are set to 644 or more restrictive (Automated)"
permission=$(stat -c %a /var/lib/rancher/rke2/server/cred/controller.kubeconfig)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.18 Ensure that the controller.kubeconfig file ownership is set to root:root (Automated)"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/cred/controller.kubeconfig)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.19 Ensure that the Kubernetes PKI directory and file ownership is set to root:root (Automated)"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/tls)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.20 Ensure that the Kubernetes PKI certificate file permissions are set to 644 or more restrictive (Automated)"

permission=$(stat -c %n\ %a /var/lib/rancher/rke2/server/tls/*.crt)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo "1.1.21 Ensure that the Kubernetes PKI key file permissions are set to 600 (Automated)"
if [ "$permission" != "600" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "600" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo






