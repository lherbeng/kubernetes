## Setting up an NGINX Load Balancer

**Prerequisites:**

- 4GB Memory
- 20GB Disk Size


**Create a directory for your LoadBalancer VMs.**

```
mkdir c:\temp\vms\nginx-loadbalancer\
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/b8b05c53-b7c8-4a0e-a8ae-1afd33599ee5)

**Create a Virtual Hard Drive for LoadBalancer folder. Open a powershell as you need administrator Privileges**

```
New-VHD -Path c:\temp\vms\nginx-loadbalancer\nginx-loadbalancer.vhdx -SizeBytes 20GB
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/5772595d-cad2-4f44-b07b-a1d21c29b615)

To create a Virtual Machine.

```
New-VM `
-Name "nginx-loadbalancer" `
-Generation 1 `
-MemoryStartupBytes 4,096MB `
-SwitchName "virtual-network" `
-VHDPath "c:\temp\vms\nginx-loadbalancer\nginx-loadbalancer.vhdx" `
-Path "c:\temp\vms\nginx-loadbalancer\"
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/32e585bc-fbe0-4295-87ed-6e89ce65a5a5)




