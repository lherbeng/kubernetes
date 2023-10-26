# 1.1.1
permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/kube-apiserver.yaml)
if [ "$permission" != "644" ]; then
    echo "Fail"
elif [ "$permission" = "644" ]; then
    echo "Pass"
fi

---


echo "# 1.1 Master Node Configuration Files"

# 1.1.1
permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/kube-apiserver.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi
