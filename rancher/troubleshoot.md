

root@masternode1:/var/log# sudo lsof -i :2380
COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
etcd    17685 root    7u  IPv4 150501      0t0  TCP localhost:2380 (LISTEN)
etcd    17685 root    8u  IPv4 150505      0t0  TCP rehltek-insights.com:2380 (LISTEN)


