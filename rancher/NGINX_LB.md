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

![image](https://github.com/lherbeng/kubernetes/assets/72662912/39ef9ec3-9df4-4505-bf9c-cad53205ef9c)

**Choose Ubuntu Server**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/4da89b86-301b-4f4f-a7ec-f955a7589944)

**DHCPv4 automatically provided IP, make sure your Ethernet cable is connected**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/2d64e338-dbb4-489f-9074-56b3c428a652)

**Leave Proxy address blank**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/19919dc5-de6e-4f7d-91c3-7cf9d274cf35)

**Click Done**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/efa0c4be-cda1-4bf6-b803-5c489f4e11e4)

**Use an Entire Disk 30GB**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/e5e19986-ba84-461a-a3e4-5fe4f6e5bb0e)

**It gives you the summary of the Filesystem**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/33c1c1ab-1a03-4c24-9b69-dc6a48cc851f)

**Enter the server's information**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/f93bea64-fd02-4ab7-a3fc-c6c1b133939f)

**Do not select OpenSSH Server**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/388574d7-36d1-4e05-930b-2c3d0c996615)

**Do not install any package, we need docker but we're going to install it manually as we need the latest package**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/b3632dc9-f3e8-43ee-b335-32105ffafd03)

**If the installation is complete, you will see the reboot now button.**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/91e87cc9-b28e-4c6f-95c1-d26763e10ced)

**If you encounter the error below, try to close the window.**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/0c9a4d2f-8f59-4040-8035-7fe3b2c8c746)

**Go to Hyper-V > right click on the machine > Turn Off the machine > then Start the machine**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/6f5984ac-a300-4216-87fb-d9f13352f3d1)

**When it's done, it will ask you the username and password.**

![image](https://github.com/lherbeng/kubernetes/assets/72662912/4e9af259-5f65-4fab-8418-47b93461332e)



