# This guide follows the general instructions of running a manual rancher install and running our own infrastructure on Hyper-v

# ***Hyper-V : Prepare our infrastructure***

In this demo, we will use Hyper-V to create our infrastructure.
For on-premise, many companies use either Hyper-V, VMWare Vsphere and other technologies to create virtual infrastructure on bare metal.

Few points to note here:

Benefit of Virtual infrastructure is that it's immutable 
- We can add and throw away virtual machines at will. 
- This makes maintenance easier as we can roll updated virtual machines instead of patching existing machines and turning them to long-living snowflakes. 
- Reduce lifespan of machines

Bare Metal provides the compute. 
- We don't want Kubernetes directly on bare metal as we want machines to be immutable. 
- This goes back to the previous point on immutability.

Every virtual machine needs to be able to reach each other on the network 
- This is a kubernetes networking requirements that all nodes can communicate with one another

# ***Hyper-V : Create our network***

In order for us to create virtual machines all on the same network, I am going to create a virtual switch in Hyper-v
Open Powershell in administrator

```
Get-NetAdapter
Import-Module Hyper-V
$ethernet = Get-NetAdapter -Name "Ethernet 2"
New-VMSwitch -Name "virtual-network" -NetAdapterName $ethernet.Name -AllowManagementOS $true -Notes "shared virtual network interface"
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/e617f86c-1825-4aed-865d-86fa44464a1c)


# ***Hyper-V : Create our machines***

Open your Hyper-V Manager and you can see that our Virtual Network Switch was created. You can use Hyper-V GUI to create a switch as well.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/7de94edf-7296-4374-a95e-4aedfb4d4970)

Download [Ubuntu 22.04.3](https://ubuntu.com/download/server).

![image](https://github.com/lherbeng/kubernetes/assets/72662912/72518911-4079-4aa5-a87b-87fb85497964)

Create 3 directory for your 3 VMs.

```
mkdir c:\temp\vms\linux-0\
mkdir c:\temp\vms\linux-1\
mkdir c:\temp\vms\linux-2\
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/413dfc45-3493-41f0-876e-bf8f178b5dbf)

Create a Virtual Hard Drive for each respected folder. Open a powershell as you need administrator Privileges.

```
New-VHD -Path c:\temp\vms\linux-0\linux-0.vhdx -SizeBytes 30GB
New-VHD -Path c:\temp\vms\linux-1\linux-1.vhdx -SizeBytes 30GB
New-VHD -Path c:\temp\vms\linux-2\linux-2.vhdx -SizeBytes 30GB
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/0291dd97-c61b-4355-9d5f-32dfcb08cc0b)

![image](https://github.com/lherbeng/kubernetes/assets/72662912/d1325cf7-0987-4a75-ac7f-e486e097dd9f)

![image](https://github.com/lherbeng/kubernetes/assets/72662912/46124659-c16a-407a-a0a3-59b85b64198f)

To create a Virtual Machine.

```
New-VM `
-Name "linux-0" `
-Generation 1 `
-MemoryStartupBytes 2048MB `
-SwitchName "virtual-network" `
-VHDPath "c:\temp\vms\linux-0\linux-0.vhdx" `
-Path "c:\temp\vms\linux-0\"
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/bdb20590-a5df-4f76-a14d-20e8912e6711)

```
New-VM `
-Name "linux-1" `
-Generation 1 `
-MemoryStartupBytes 2048MB `
-SwitchName "virtual-network" `
-VHDPath "c:\temp\vms\linux-1\linux-1.vhdx" `
-Path "c:\temp\vms\linux-1\"
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/f31c5155-999f-47b3-ad69-cd9b46dd9f1f)

```
New-VM `
-Name "linux-2" `
-Generation 1 `
-MemoryStartupBytes 2048MB `
-SwitchName "virtual-network" `
-VHDPath "c:\temp\vms\linux-2\linux-2.vhdx" `
-Path "c:\temp\vms\linux-2\"
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/2775e7db-c445-4e72-bdac-828b144f1553)

Open up the Hyper-V Manager and you'll be able to see the 3 VMs and all are off

![image](https://github.com/lherbeng/kubernetes/assets/72662912/85ebac24-f835-4ca4-948d-80c7d2b1fa10)


Setup a DVD drive that holds the iso file for Ubuntu Server

```
Set-VMDvdDrive -VMName "linux-0" -ControllerNumber 1 -Path "C:\temp\ubuntu-22.04.3-live-server-amd64.iso"
Set-VMDvdDrive -VMName "linux-1" -ControllerNumber 1 -Path "C:\temp\ubuntu-22.04.3-live-server-amd64.iso"
Set-VMDvdDrive -VMName "linux-2" -ControllerNumber 1 -Path "C:\temp\ubuntu-22.04.3-live-server-amd64.iso"
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/fc998e01-9675-46c8-b3b1-03e416cd3ec5)

Start our VM's

```
Start-VM -Name "linux-0"
Start-VM -Name "linux-1"
Start-VM -Name "linux-2"
```

![image](https://github.com/lherbeng/kubernetes/assets/72662912/ba5b8206-cd59-4f14-9fcd-afe4a76d4c7a)

To change the memory allocation of a running virtual machine, Shut down the virtual machine:

![image](https://github.com/lherbeng/kubernetes/assets/72662912/88a3beff-69a0-4dc4-9c37-f31b74fab399)

To set the memory allocation for your virtual machine to 6GB using the Set-VMMemory cmdlet in PowerShell, you can use the following command:

![image](https://github.com/lherbeng/kubernetes/assets/72662912/852e852c-bfca-4e81-9de2-55dd37fcc12b)

Now we can open up Hyper-v Manager and see our infrastructure. Double click on machine to setup Ubuntu.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/71a34435-8a96-45df-82bd-04cf027a008a)

Choose Ubuntu Server

![image](https://github.com/lherbeng/kubernetes/assets/72662912/d71ad16d-e249-471f-acfa-2cec7bd56358)

DHCPv4 automatically provided IP, make sure your Ethernet cable is connected

![image](https://github.com/lherbeng/kubernetes/assets/72662912/8583b983-0f38-4cc9-83b1-c006dd3cde93)

Leave Proxy address blank

![image](https://github.com/lherbeng/kubernetes/assets/72662912/e86acfb1-848e-4489-85ba-ed1f74029fa7)

Click Done

![image](https://github.com/lherbeng/kubernetes/assets/72662912/9098e381-ad8f-4259-a556-e32a8305528b)

User an Entire Disk 30GB

![image](https://github.com/lherbeng/kubernetes/assets/72662912/ecb6b7d3-11c1-41e1-bc95-7c8c13207a6a)

It gives you the summary of the Filesystem

![image](https://github.com/lherbeng/kubernetes/assets/72662912/910a1808-f86c-4b71-ac3e-f88209ae9916)

Enter the server's information

![image](https://github.com/lherbeng/kubernetes/assets/72662912/9b725c08-2bab-4d42-b9a1-b43758241410)

Do not select OpenSSH Server

![image](https://github.com/lherbeng/kubernetes/assets/72662912/b1ab0f90-b329-4e83-a738-19af8f2a9049)

Do not install any package, we need docker but we're going to install it manually as we need the latest package

![image](https://github.com/lherbeng/kubernetes/assets/72662912/ed7433dc-f9f7-4914-8971-8a98d10e26cf)

If the installation is complete, you will see the reboot now button.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/8ef3c88d-801d-4730-b670-84dce20ffec4)

If you encounter the error below, try to close the window.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/51b1d583-7eee-4005-bba6-3d9a2bff26b4)

Go to Hyper-V > right click on the machine > Turn Off the machine > then Start the machine

![image](https://github.com/lherbeng/kubernetes/assets/72662912/99b5f6d4-7b6d-417c-9b55-1d084cf4a110)


If you encounter the error below:

![image](https://github.com/lherbeng/kubernetes/assets/72662912/6ba9dc68-25df-433c-8067-ac6fb4cbe8e3)

Try to stop the VM and execute the following command:

![image](https://github.com/lherbeng/kubernetes/assets/72662912/8f86a95e-3b88-402a-8907-70fe2dfeb4f7)


