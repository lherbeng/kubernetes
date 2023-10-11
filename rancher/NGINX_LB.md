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

**To create a Virtual Machine.**

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

**Open up the Hyper-V Manager and you'll be able to see the nginx-loadbalancer VM and it is off**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/a2c4d3a2-c75c-4666-8159-e68ebacadeef)

**Setup a DVD drive that holds the iso file for Ubuntu Server**

```
Set-VMDvdDrive -VMName "nginx-loadbalancer" -ControllerNumber 1 -Path "C:\temp\ubuntu-22.04.3-live-server-amd64.iso"
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/00c46a11-d551-41eb-9115-c101fae4d24d)

**Start our nginx-loadbalancer VM**

```
Start-VM -Name "nginx-loadbalancer"
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/de4f294e-5a7d-4ce8-b667-c0c84982defc)

**Now we can open up Hyper-v Manager and see our infrastructure. Double click on machine to setup Ubuntu.**

**Choose Ubuntu Server**

**DHCPv4 automatically provided IP, make sure your Ethernet cable is connected**

**Leave Proxy address blank**

**Click Done**

**Use an Entire Disk 30GB**

**It gives you the summary of the Filesystem**

**Enter the server's information**

**Do not install any package, we need docker but we're going to install it manually as we need the latest package**

**If the installation is complete, you will see the reboot now button.**

**If you encounter the error below, try to close the window.**

**Go to Hyper-V > right click on the machine > Turn Off the machine > then Start the machine**

**When it's done, it will ask you the username and password.**




