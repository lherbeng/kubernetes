#!/bin/bash

{

# 1.1 Master Node Configuration Files

echo "1.1.1 Ensure that the API server pod specification file permissions are set to 644 or more restrictive (Automated)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/kube-apiserver.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.2 Ensure that the API server pod specification file ownership is set to root:root (Automated)" >> "self-assessment_failed_$(hostname).txt"
ownership=$(stat -c %U:%G /var/lib/rancher/rke2/agent/pod-manifests/kube-apiserver.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.3 Ensure that the controller manager pod specification file permissions are set to 644 or more restrictive (Automated)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/kube-controller-manager.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.4 Ensure that the controller manager pod specification file ownership is set to root:root (Automated)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/agent/pod-manifests/kube-controller-manager.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.5 Ensure that the scheduler pod specification file permissions are set to 644 or more restrictive (Automated)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/kube-scheduler.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.6 Ensure that the scheduler pod specification file ownership is set to root:root (Automated)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/agent/pod-manifests/kube-scheduler.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.7 Ensure that the etcd pod specification file permissions are set to 644 or more restrictive (Automated)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/etcd.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo 

echo "1.1.8 Ensure that the etcd pod specification file ownership is set to root:root (Automated)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/agent/pod-manifests/etcd.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.9 Ensure that the Container Network Interface file permissions are set to 644 or more restrictive (Manual)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/server/manifests/rke2-canal.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.10 Ensure that the Container Network Interface file ownership is set to root:root (Manual)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/manifests/rke2-canal.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.11 Ensure that the etcd data directory permissions are set to 700 or more restrictive (Automated)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/server/db/etcd)
if [ "$permission" != "700" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "700" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.12 Ensure that the etcd data directory ownership is set to etcd:etcd (Automated)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/db/etcd)
if [ "$ownership" != "etcd:etcd" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "etcd:etcd" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.13 Ensure that the admin.conf file permissions are set to 644 or more restrictive (Automated)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/server/cred/admin.kubeconfig)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.14 Ensure that the admin.conf file ownership is set to root:root (Automated)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/cred/admin.kubeconfig)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.15 Ensure that the scheduler.conf file permissions are set to 644 or more restrictive (Automated)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/server/cred/scheduler.kubeconfig)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.16 Ensure that the scheduler.conf file ownership is set to root:root (Automated)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/cred/scheduler.kubeconfig)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.17 Ensure that the controller.kubeconfig file permissions are set to 644 or more restrictive (Automated)" >> "self-assessment_failed_$(hostname).txt"
permission=$(stat -c %a /var/lib/rancher/rke2/server/cred/controller.kubeconfig)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.18 Ensure that the controller.kubeconfig file ownership is set to root:root (Automated)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/cred/controller.kubeconfig)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "1.1.19 Ensure that the Kubernetes PKI directory and file ownership is set to root:root (Automated)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/tls)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
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

echo

echo "1.2.3 Ensure that the --DenyServiceExternalIPs is not set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep | grep -o -- --DenyServiceExternalIPs

echo

echo "1.2.4 Ensure that the --kubelet-https argument is set to true (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep | grep -o -- --kubelet-https=true

echo

echo "1.2.5 Ensure that the --kubelet-client-certificate and --kubelet-client-key arguments are set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.6 Ensure that the --kubelet-certificate-authority argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.7 Ensure that the --authorization-mode argument is not set to AlwaysAllow (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.8 Ensure that the --authorization-mode argument includes Node (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.9 Ensure that the --authorization-mode argument includes RBAC (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.10 Ensure that the admission control plugin EventRateLimit is set (Manual)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.11 Ensure that the admission control plugin AlwaysAdmit is not set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.12 Ensure that the admission control plugin AlwaysPullImages is set (Manual)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.13 Ensure that the admission control plugin SecurityContextDeny is set if PodSecurityPolicy is not used (Manual)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.14 Ensure that the admission control plugin ServiceAccount is set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.15 Ensure that the admission control plugin NamespaceLifecycle is set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.16 Ensure that the admission control plugin NodeRestriction is set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.17 Ensure that the --secure-port argument is not set to 0 (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.18 Ensure that the --profiling argument is set to false (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.19 Ensure that the --audit-log-path argument is set (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.20 Ensure that the --audit-log-maxage argument is set to 30 or as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.21 Ensure that the --audit-log-maxbackup argument is set to 10 or as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.22 Ensure that the --audit-log-maxsize argument is set to 100 or as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.23 Ensure that the --request-timeout argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.24 Ensure that the --service-account-lookup argument is set to true (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.25 Ensure that the --service-account-key-file argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.26 Ensure that the --etcd-certfile and --etcd-keyfile arguments are set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.27 Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.28 Ensure that the --client-ca-file argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.29 Ensure that the --etcd-cafile argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.30 Ensure that the --encryption-provider-config argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "1.2.31 Ensure that encryption providers are appropriately configured (Automated)"

grep aescbc /var/lib/rancher/rke2/server/cred/encryption-config.json

echo

echo "1.2.32 Ensure that the API Server only makes use of Strong Cryptographic Ciphers (Manual)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

# 1.3 Controller Manager

echo "1.3.1 Ensure that the --terminated-pod-gc-threshold argument is set as appropriate (Manual)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo

echo "1.3.2 Ensure that the --profiling argument is set to false (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo

echo "1.3.3 Ensure that the --use-service-account-credentials argument is set to true (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo

echo "1.3.4 Ensure that the --service-account-private-key-file argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo

echo "1.3.5 Ensure that the --root-ca-file argument is set as appropriate (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo

echo "1.3.6 Ensure that the RotateKubeletServerCertificate argument is set to true (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo

echo "1.3.7 Ensure that the --bind-address argument is set to 127.0.0.1 (Automated)"

/bin/ps -ef | grep kube-controller-manager | grep -v grep

echo

# 1.4 Scheduler

echo "1.4.1 Ensure that the --profiling argument is set to false (Automated)"

/bin/ps -ef | grep kube-scheduler | grep -v grep

echo

echo "1.4.2 Ensure that the --bind-address argument is set to 127.0.0.1 (Automated)"

/bin/ps -ef | grep kube-scheduler | grep -v grep

echo

# 2 Etcd Node Configuration

echo "2.1 Ensure that the cert-file and key-file fields are set as appropriate (Automated)"

grep -E 'cert-file|key-file' /var/lib/rancher/rke2/server/db/etcd/config

echo

echo "2.2 Ensure that the client-cert-auth field is set to true (Automated)"

grep 'client-cert-auth' /var/lib/rancher/rke2/server/db/etcd/config

echo

echo "2.3 Ensure that the auto-tls field is not set to true (Automated)"

grep 'auto-tls' /var/lib/rancher/rke2/server/db/etcd/config

echo

echo "2.4 Ensure that the peer-cert-file and peer-key-file fields are set as appropriate (Automated)"

grep -E 'peer-server-client.crt|peer-server-client.key' /var/lib/rancher/rke2/server/db/etcd/config

echo

echo "2.5 Ensure that the peer-client-cert-auth argument is set to true (Automated)"

grep 'peer-client-cert-auth' /var/lib/rancher/rke2/server/db/etcd/config

echo

echo "2.6 Ensure that the peer-auto-tls field is not set to true (Automated)"

grep 'peer-auto-tls' /var/lib/rancher/rke2/server/db/etcd/config

echo

echo "2.7 Ensure that a unique Certificate Authority is used for etcd (Manual)"

# To find the ca file used by etcd:
grep 'trusted-ca-file' /var/lib/rancher/rke2/server/db/etcd/config
# To find the kube-apiserver process:
/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

# 3 Control Plane Configuration

echo "3.1.1 Client certificate authentication should not be used for users (Manual)"

echo "Audit: Review user access to the cluster and ensure that users are not making use of Kubernetes client certificate authentication."
echo "Remediation: Alternative mechanisms provided by Kubernetes such as the use of OIDC should be implemented in place of client certificates."

echo

# 3.2 Logging 

echo "3.2.1 Ensure that a minimal audit policy is created (Automated)"

/bin/ps -ef | grep kube-apiserver | grep -v grep

echo

echo "3.2.2 Ensure that the audit policy covers key security concerns (Manual)"

echo "Rationale: Security audit logs should cover access and modification of key resources in the cluster, to enable them to form an effective part of a security environment."

echo

# 4 Worker Node Security Configuration

echo "4.1.1 Ensure that the kubelet service file permissions are set to 644 or more restrictive (Automated)"

echo "Remediation: RKE2 doesn’t launch the kubelet as a service. It is launched and managed by the RKE2 supervisor process. All configuration is passed to it as command line arguments at run time."

echo

echo "4.1.2 Ensure that the kubelet service file ownership is set to root:root (Automated)"

echo "Remediation: RKE2 doesn’t launch the kubelet as a service. It is launched and managed by the RKE2 supervisor process. All configuration is passed to it as command line arguments at run time."

echo

echo "4.1.3 Ensure that the proxy kubeconfig file permissions are set to 644 or more restrictive (Manual)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/server/manifests/rke2-kube-proxy.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "4.1.4 Ensure that the proxy kubeconfig file ownership is set to root:root (Manual)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/manifests/rke2-kube-proxy.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "4.1.5 Ensure that the kubelet.conf file permissions are set to 644 or more restrictive (Automated)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/agent/kubelet.kubeconfig)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo 

echo "4.1.6 Ensure that the kubelet.conf file ownership is set to root:root (Manual)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/agent/kubelet.kubeconfig)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo 

echo "4.1.7 Ensure that the certificate authorities file permissions are set to 644 or more restrictive (Manual)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/server/tls/server-ca.crt)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "4.1.8 Ensure that the client certificate authorities file ownership is set to root:root (Automated)" >> "self-assessment_failed_$(hostname).txt"

ownership=$(stat -c %U:%G /var/lib/rancher/rke2/server/tls/client-ca.crt)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

echo

echo "4.1.9 Ensure that the kubelet configuration file has permissions set to 600 or more restrictive (Automated)"

echo "Remediation: RKE2 doesn’t require or maintain a configuration file for the kubelet process. All configuration is passed to it as command line arguments at run time."

echo

echo "4.1.10 Ensure that the kubelet configuration file ownership is set to root:root (Automated)"

echo "Remediation: RKE2 doesn’t require or maintain a configuration file for the kubelet process. All configuration is passed to it as command line arguments at run time."

echo

# 4.2 Kubelet

echo "4.2.1 Ensure that the --anonymous-auth argument is set to false (Automated)"

/bin/ps -ef | grep kubelet | grep -v grep

echo

echo "4.2.2 Ensure that the --authorization-mode argument is not set to AlwaysAllow (Automated)"

/bin/ps -ef | grep kubelet | grep -v grep

echo

echo "4.2.3 Ensure that the --client-ca-file argument is set as appropriate (Automated)"

/bin/ps -ef | grep kubelet | grep -v grep

echo

echo "4.2.4 Ensure that the --read-only-port argument is set to 0 (Automated)"

/bin/ps -ef | grep kubelet | grep -v grep

echo

echo "4.2.5 Ensure that the --streaming-connection-idle-timeout argument is not set to 0 (Automated)"

/bin/ps -ef | grep kubelet | grep -v grep

echo

echo "4.2.6 Ensure that the --protect-kernel-defaults argument is set to true (Automated)"

/bin/ps -ef | grep kubelet | grep -v grep

echo

echo "4.2.7 Ensure that the --make-iptables-util-chains argument is set to true (Automated)"

/bin/ps -ef | grep kubelet | grep -v grep

echo

echo "4.2.8 Ensure that the --hostname-override argument is not set (Manual)"

echo "Remediation: RKE2 does set this parameter for each host, but RKE2 also manages all certificates in the cluster. It ensures the hostname-override is included as a subject alternative name (SAN) in the kubelet's certificate."

echo

echo "4.2.9 Ensure that the --event-qps argument is set to 0 or a level which ensures appropriate event capture (Manual)"

echo "Remediation: See CIS Benchmark guide for further details on configuring this."

echo

echo "4.2.10 Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate (Automated)"

/bin/ps -ef | grep kubelet | grep -v grep

echo

echo "4.2.11 Ensure that the --rotate-certificates argument is not set to false (Manual)"

/bin/ps -ef | grep kubelet | grep -v grep

echo

echo "4.2.12 Ensure that the RotateKubeletServerCertificate argument is set to true (Manual)"

/bin/ps -ef | grep kubelet | grep -v grep4.2.13

echo

echo "4.2.13 Ensure that the Kubelet only makes use of Strong Cryptographic Ciphers (Manual)"

echo "Remediation: Configuration of the parameter is dependent on your use case. Please see the CIS Kubernetes Benchmark for suggestions on configuring this for your use case."

echo

# 5 Kubernetes Policies

echo "5.1.1 Ensure that the cluster-admin role is only used where required (Manual)"

echo "Remediation: RKE2 does not make inappropriate use of the cluster-admin role. Operators must audit their workloads of additional usage. See the CIS Benchmark guide for more details."

echo

echo "5.1.2 Minimize access to secrets (Manual)"

echo "Remediation: RKE2 limits its use of secrets for the system components appropriately, but operators must audit the use of secrets by their workloads. See the CIS Benchmark guide for more details."

echo

echo "5.1.3 Minimize wildcard use in Roles and ClusterRoles (Manual)"

# Retrieve the roles defined across each namespaces in the cluster and review for wildcards
/var/lib/rancher/rke2/bin/kubectl get roles --all-namespaces -o yaml

# Retrieve the cluster roles defined in the cluster and review for wildcards
/var/lib/rancher/rke2/bin/kubectl get clusterroles -o yaml

echo "Verify that there are not wildcards in use."

echo

echo "5.1.4 Minimize access to create pods (Manual)"

echo "Remediation: Operators should review who has access to create pods in their cluster. See the CIS Benchmark guide for more details."

echo

echo "5.1.5 Ensure that default service accounts are not actively used. (Automated)"

echo "Remediation: Create explicit service accounts wherever a Kubernetes workload requires specific access to the Kubernetes API server. Modify the configuration of each default service account to include this value"

echo "automountServiceAccountToken: false"

echo 

echo "5.1.6 Ensure that Service Account Tokens are only mounted where necessary (Manual)"

echo "Remediation: The pods launched by RKE2 are part of the control plane and generally need access to communicate with the API server, thus this control does not apply to them. Operators should review their workloads and take steps to modify the definition of pods and service accounts which do not need to mount service account tokens to disable it."

echo

echo "5.1.7 Avoid use of system:masters group (Manual)"

echo "Remediation: Remove the system:masters group from all users in the cluster."

echo

echo "5.1.7 Limit use of the Bind, Impersonate and Escalate permissions in the Kubernetes cluster (Manual)"

echo "Remediation: Where possible, remove the impersonate, bind and escalate rights from subjects."

echo

# 5.2 Pod Security Standards

echo "5.2.1 Ensure that the cluster has at least one active policy control mechanism in place (Manual)"

echo "Remediation: PSA is enabled since v1.23 by default in RKE2, no remediation necessary."

echo

echo "5.2.2 Minimize the admission of privileged containers (Manual)"

config_file=$(ps aux | grep kube-apiserver |  grep -- --admission-control-config-file | sed 's%.*admission-control-config-file[= ]\([^ ]*\).*%\1%')

grep "enforce:" ${config_file}

echo "Verify that the returned value is enforce: restricted"

echo

echo "5.2.3 Minimize the admission of containers wishing to share the host process ID namespace (Automated)"

config_file=$(ps aux | grep kube-apiserver |  grep -- --admission-control-config-file | sed 's%.*admission-control-config-file[= ]\([^ ]*\).*%\1%')

grep "enforce:" ${config_file}

echo "Verify that the returned value is enforce: restricted"

echo

echo "5.2.4 Minimize the admission of containers wishing to share the host IPC namespace (Automated)"

config_file=$(ps aux | grep kube-apiserver |  grep -- --admission-control-config-file | sed 's%.*admission-control-config-file[= ]\([^ ]*\).*%\1%')

grep "enforce:" ${config_file}

echo "Verify that the returned value is enforce: restricted"

echo

echo "5.2.5 Minimize the admission of containers wishing to share the host network namespace (Automated)"

config_file=$(ps aux | grep kube-apiserver |  grep -- --admission-control-config-file | sed 's%.*admission-control-config-file[= ]\([^ ]*\).*%\1%')

grep "enforce:" ${config_file}

echo "Verify that the returned value is enforce: restricted"

echo

echo "5.2.6 Minimize the admission of containers with allowPrivilegeEscalation (Automated)"

config_file=$(ps aux | grep kube-apiserver |  grep -- --admission-control-config-file | sed 's%.*admission-control-config-file[= ]\([^ ]*\).*%\1%')

grep "enforce:" ${config_file}

echo "Verify that the returned value is enforce: restricted"

echo

echo "5.2.7 Minimize the admission of root containers (Automated)"

config_file=$(ps aux | grep kube-apiserver |  grep -- --admission-control-config-file | sed 's%.*admission-control-config-file[= ]\([^ ]*\).*%\1%')

grep "enforce:" ${config_file}

echo "Verify that the returned value is enforce: restricted"

echo

echo "5.2.8 Minimize the admission of containers with the NET_RAW capability (Automated)"

config_file=$(ps aux | grep kube-apiserver |  grep -- --admission-control-config-file | sed 's%.*admission-control-config-file[= ]\([^ ]*\).*%\1%')

grep "enforce:" ${config_file}

echo "Verify that the returned value is enforce: restricted"

echo

echo "5.2.9 Minimize the admission of containers with added capabilities (Automated)"

echo "Remediation: Ensure that allowedCapabilities is not present in policies for the cluster unless it is set to an empty array."

echo

echo "5.2.10 Minimize the admission of containers with capabilities assigned (Manual)"

echo "Remediation: Review the use of capabilities in applications running on your cluster. Where a namespace contains applications which do not require any Linux capabilities to operate consider adding a PSP which forbids the admission of containers which do not drop all capabilities."

echo

echo "5.2.11 Minimize the admission of Windows HostProcess containers (Manual)"

echo "Remediation: Add policies to each namespace in the cluster which has user workloads to restrict the admission of containers that have .securityContext.windowsOptions.hostProcess set to true."

echo

echo "5.2.12 Minimize the admission of HostPath volumes (Manual)"

echo "Remediation: Add policies to each namespace in the cluster which has user workloads to restrict the admission of containers with hostPath volumes."

echo

echo "5.2.13 Minimize the admission of containers which use HostPorts (Manual)"

echo "Remediation: Add policies to each namespace in the cluster which has user workloads to restrict the admission of containers which use hostPort sections"

echo 

# 5.3 Network Policies and CNI

echo "5.3.1 Ensure that the CNI in use supports Network Policies (Automated)"

echo "Remediation: By default, RKE2 use Canal (Calico and Flannel) and fully supports network policies."

echo

echo "5.3.2 Ensure that all Namespaces have Network Policies defined (Automated)"

for i in kube-system kube-public default; do
    /var/lib/rancher/rke2/bin/kubectl get networkpolicies -n $i;
done

echo "Verify that there are network policies applied to each of the namespaces"

echo

# 5.4 Secrets Management 

echo "5.4.1 Prefer using secrets as files over secrets as environment variables (Manual)"

/var/lib/rancher/rke2/bin/kubectl get all -o jsonpath='{range .items[?(@..secretKeyRef)]} {.kind} {.metadata.name} {"\n"}{end}' -A

echo

echo "5.4.2 Consider external secret storage (Manual)"

echo "Audit: Review your secrets management implementation."

echo "Remediation: Refer to the secrets management options offered by your cloud provider or a third-party secrets management solution."

echo

# 5.5 Extensible Admission Control

echo "5.5.1 Configure Image Provenance using ImagePolicyWebhook admission controller (Manual)"

echo "Audit: Review the pod definitions in your cluster and verify that image provenance is configured as appropriate."

echo "Remediation: Follow the Kubernetes documentation and setup image provenance."

echo

# 5.6 Omitted

echo "The v1.23 guide skips 5.6 and goes from 5.5 to 5.7. We are including it here merely for explanation."

echo

# 5.7 General Policies

echo "5.7.1 Create administrative boundaries between resources using namespaces (Manual)"

/var/lib/rancher/rke2/bin/kubectl get namespaces

echo

echo "5.7.2 Ensure that the seccomp profile is set to docker/default in your pod definitions (Manual)"

echo "Audit: Review the pod definitions in your cluster. It should create a line as below:"

echo "annotations:
  seccomp.security.alpha.kubernetes.io/pod: docker/default"

echo "Remediation: Review the Kubernetes documentation and if needed, apply a relevant PodSecurityPolicy."

echo

echo "5.7.3 Apply Security Context to Your Pods and Containers (Manual)"

echo "Audit: Review the pod definitions in your cluster and verify that you have security contexts defined as appropriate."

echo "Remediation: Follow the Kubernetes documentation and apply security contexts to your pods. For a suggested list of security contexts, you may refer to the CIS Security Benchmark."

echo

echo "5.7.4 The default namespace should not be used (Manual)"

/var/lib/rancher/rke2/bin/kubectl get all -n default

} >> "self-assessment_summary_$(hostname).txt" 2>&1 | grep "Fail" >> "self-assessment_failed_$(hostname).txt"

if [ ! -d "/d3/data01/cishardening" ]; then
    mkdir -p /d3/data01/cishardening
fi

cp "self-assessment_summary_$(hostname).txt" /d3/data01/cishardening
cp "self-assessment_failed_$(hostname).txt" /d3/data01/cishardening

# Sending the email with attachments
recipient="recipient@example.com"
subject="Self-Assessment Summary"
body="self-assessment_summary_$(hostname).txt"
failed_logs="self-assessment_failed_$(hostname).txt"

mail -s "$subject" -a "$body" -a "$failed_logs" "$recipient" < /dev/null

---

#!/bin/bash

# Define the recipient email address
recipient="recipient@example.com"

# Define the subject of the email
subject="Self-Assessment Summary"

# Loop through all the self-assessment files and attach them to the email
for file in self-assessment_summary_*.txt self-assessment_failed_*.txt; do
    attachments+=("-a" "$file")
done

# Send the email with the files as attachments
echo "See attached files." | mailx -s "$subject" "${attachments[@]}" "$recipient"

---

#!/bin/bash

# Define the recipient email address
recipient="recipient@example.com"

# Define the subject of the email
subject="Self-Assessment Summary"

# Initialize the attachments array
attachments=()

# Loop through all the .txt files and add them to the attachments array
for file in self-assessment_summary_*.txt self-assessment_failed_*.txt; do
    attachments+=("-a" "$file")
done

# Send the email with the files as attachments
echo "See attached files." | mailx -s "$subject" "${attachments[@]}" "$recipient"

---



#!/bin/bash

# Your script commands here

{
    # Your commands
} >> "self-assessment_summary_$(hostname).txt" 2>&1

grep "Fail" "self-assessment_summary_$(hostname).txt" >> "self-assessment_failed_$(hostname).txt"

if [ ! -d "/d3/data01/cishardening" ]; then
    mkdir -p "/d3/data01/cishardening"
fi

cp "self-assessment_summary_$(hostname).txt" "/d3/data01/cishardening/"
cp "self-assessment_failed_$(hostname).txt" "/d3/data01/cishardening/"

# Send all files in /d3/data01/cishardening as attachments in a single email
recipient="recipient@example.com"
subject="Self-Assessment Summary"
body="See attached files."

cd /d3/data01/cishardening/
attachments=$(find . -maxdepth 1 -type f -name "*.txt" -exec printf "{} " \;)

echo -e "$body" | mail -s "$subject" $attachments -- "$recipient"

---

https://stackoverflow.com/questions/30384962/using-sendmail-command-while-using-uuencode-to-send-attachment

cd /d3/data01/cishardening/
attachments=$(find . -maxdepth 1 -type f -name "*.txt" -exec printf "{} " \;)

echo -e "$body" | mail -s "$subject" --attach=$attachments $recipient


---
didn't work

cd /d3/data01/cishardening/
attachments=$(find . -maxdepth 1 -type f -name "*.txt" -exec printf "{} " \;)

echo -e "$body" | mail -s "$subject" -a $attachments $recipient

---

It works! however still receiving 3 emails

# Compose the attachment list
attachments=""
for file in *txt; do
    attachments+="-a $file "
done

# Send email with all attachments
echo -e "$body" | mailx -s "$subject" $attachments $recipient


---

It works! however still receiving 3 emails

# Create a list of all .txt files
cd /d3/data01/cishardening/
attachments=""

for file in *txt; do
    attachments+=" -a $file"
done

# Send email with all attachments
recipient="recipient@example.com"
subject="Self-Assessment Summary"
body="See attached files."

echo -e "$body" | mailx -s "$subject" $attachments $recipient

---

# Send email with all attachments for hostnameA
if [[ $(hostname) == $hostnameA ]]; then
    echo -e "$body" | mailx -s "$subject" $attachments $recipient
fi

---


cp "self-assessment_summary_$(hostname).txt" "/d3/data01/cishardening/"
cp "self-assessment_failed_$(hostname).txt" "/d3/data01/cishardening/"

# Send all files in /d3/data01/cishardening as attachments in a single email for specified hostnames
recipient="recipient@example.com"
subject="Self-Assessment Summary"
body="See attached files."

declare -a hostnames=("hostnameA" "hostnameB" "hostnameC")  # Add more hostnames as needed

cd /d3/data01/cishardening/

# Compose the attachment list
attachments=""
for file in *txt; do
    attachments+="-a $file "
done

# Send email with all attachments for specified hostnames
for h in "${hostnames[@]}"; do
    if [[ $(hostname) == $h ]]; then
        echo -e "$body" | mailx -s "$subject" $attachments $recipient
    fi
done

---

current_hostname=$(hostname)

if [ "$current_hostname" = "hostnameA" ]; then
    attachments=""
    for file in /d3/data01/cishardening/*txt; do
        attachments+="-a $file "
    done
    echo -e "$body" | mailx -s "$subject" $attachments $recipient
elif [ "$current_hostname" = "hostnameB" ]; then
    attachments=""
    for file in /d3/data01/cishardening/*txt; do
        attachments+="-a $file "
    done
    echo -e "$body" | mailx -s "$subject" $attachments $recipient
elif [ "$current_hostname" = "hostnameC" ]; then
    attachments=""
    for file in /d3/data01/cishardening/*txt; do
        attachments+="-a $file "
    done
    echo -e "$body" | mailx -s "$subject" $attachments $recipient
else
    echo "Hostname not recognized."
fi







