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

stat -c %n\ %a /var/lib/rancher/rke2/server/tls/*.crt

echo

echo "1.1.21 Ensure that the Kubernetes PKI key file permissions are set to 600 (Automated)"

stat -c %n\ %a /var/lib/rancher/rke2/server/tls/*.key

echo

# 1.2 API Server

echo "1.2.1 Ensure that the --anonymous-auth argument is set to false (Manual)"

/bin/ps -ef | grep kube-apiserver | grep -v grep | grep -o -- --anonymous-auth=false

echo

echo "1.2.2 Ensure that the --token-auth-file parameter is not set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep | grep -o -- --token-auth-file

echo "1.2.3 Ensure that the --DenyServiceExternalIPs is not set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep | grep -o -- --DenyServiceExternalIPs

echo "1.2.4 Ensure that the --kubelet-https argument is set to true (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep | grep -o -- --kubelet-https=true

echo "1.2.5 Ensure that the --kubelet-client-certificate and --kubelet-client-key arguments are set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.6 Ensure that the --kubelet-certificate-authority argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.7 Ensure that the --authorization-mode argument is not set to AlwaysAllow (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.8 Ensure that the --authorization-mode argument includes Node (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.9 Ensure that the --authorization-mode argument includes RBAC (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.10 Ensure that the admission control plugin EventRateLimit is set (Manual)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.11 Ensure that the admission control plugin AlwaysAdmit is not set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.12 Ensure that the admission control plugin AlwaysPullImages is set (Manual)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.13 Ensure that the admission control plugin SecurityContextDeny is set if PodSecurityPolicy is not used (Manual)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.14 Ensure that the admission control plugin ServiceAccount is set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.15 Ensure that the admission control plugin NamespaceLifecycle is set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.16 Ensure that the admission control plugin NodeRestriction is set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.17 Ensure that the --secure-port argument is not set to 0 (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.18 Ensure that the --profiling argument is set to false (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.19 Ensure that the --audit-log-path argument is set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.20 Ensure that the --audit-log-maxage argument is set to 30 or as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.21 Ensure that the --audit-log-maxbackup argument is set to 10 or as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.22 Ensure that the --audit-log-maxsize argument is set to 100 or as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.23 Ensure that the --request-timeout argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.24 Ensure that the --service-account-lookup argument is set to true (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.25 Ensure that the --service-account-key-file argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.26 Ensure that the --etcd-certfile and --etcd-keyfile arguments are set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.27 Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.28 Ensure that the --client-ca-file argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.29 Ensure that the --etcd-cafile argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.30 Ensure that the --encryption-provider-config argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo "1.2.31 Ensure that encryption providers are appropriately configured (Automated)"

grep aescbc /var/lib/rancher/rke2/server/cred/encryption-config.json

echo "1.2.32 Ensure that the API Server only makes use of Strong Cryptographic Ciphers (Manual)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

# 1.3 Controller Manager

echo "1.3.1 Ensure that the --terminated-pod-gc-threshold argument is set as appropriate (Manual)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo "1.3.2 Ensure that the --profiling argument is set to false (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo "1.3.3 Ensure that the --use-service-account-credentials argument is set to true (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo "1.3.4 Ensure that the --service-account-private-key-file argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo "1.3.5 Ensure that the --root-ca-file argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo "1.3.6 Ensure that the RotateKubeletServerCertificate argument is set to true (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo "1.3.7 Ensure that the --bind-address argument is set to 127.0.0.1 (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep













