# 1.1.1
permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/kube-apiserver.yaml)
if [ "$permission" != "644" ]; then
    echo "Fail"
elif [ "$permission" = "644" ]; then
    echo "Pass"
fi
