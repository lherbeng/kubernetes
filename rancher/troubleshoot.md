

root@masternode1:/var/log# sudo lsof -i :2380
COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
etcd    17685 root    7u  IPv4 150501      0t0  TCP localhost:2380 (LISTEN)
etcd    17685 root    8u  IPv4 150505      0t0  TCP rehltek-insights.com:2380 (LISTEN)



cat /var/lib/rancher/rke2/agent/logs/kubelet.log

cat /var/lib/rancher/rke2/agent/containerd/containerd.log | grep error

time="2024-02-13T11:45:32.037912326Z" level=error msg="failed to load cni during init, please check CRI plugin status before setting up network for pods" error="cni config load failed: 
no network config found in /etc/cni/net.d: cni plugin not initialized: failed to load cni config"

---

https://stackoverflow.com/questions/72213264/rancher-rke2-etcd-backup-and-restore-infinit-loop

---

https://gist.github.com/superseb/3b78f47989e0dbc1295486c186e944bf#on-the-etcd-host-itself


## Check manifest file in RKE2

ls -lah /var/lib/rancher/rke2/server/manifests/

## kube-apiserver

 /var/lib/rancher/rke2/agent/pod-manifests/etcd.yaml /var/lib/rancher/rke2/agent/pod-manifests/kube-apiserver.yaml

 ##

 apt install net-tools

##

journalctl -f -u rke2-server


 


