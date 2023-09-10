This guide follows the general instructions of running a manual rancher install and running our own infrastructure on Hyper-v

# ***Hyper-V : Prepare our infrastructure***

In this demo, we will use Hyper-V to create our infrastructure.
For on-premise, many companies use either Hyper-V, VMWare Vsphere and other technologies to create virtual infrastructure on bare metal.

Few points to note here:

Benefit of Virtual infrastructure is that it's immutable a) We can add and throw away virtual machines at will. b) This makes maintenance easier as we can roll updated virtual machines instead of patching existing machines and turning them to long-living snowflakes. c) Reduce lifespan of machines

Bare Metal provides the compute. a) We don't want Kubernetes directly on bare metal as we want machines to be immutable. b) This goes back to the previous point on immutability.

Every virtual machine needs to be able to reach each other on the network a) This is a kubernetes networking requirements that all nodes can communicate with one another

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

New-VM `
-Name "linux-1" `
-Generation 1 `
-MemoryStartupBytes 2048MB `
-SwitchName "virtual-network" `
-VHDPath "c:\temp\vms\linux-1\linux-1.vhdx" `
-Path "c:\temp\vms\linux-1\"

New-VM `
-Name "linux-2" `
-Generation 1 `
-MemoryStartupBytes 2048MB `
-SwitchName "virtual-network" `
-VHDPath "c:\temp\vms\linux-2\linux-2.vhdx" `
-Path "c:\temp\vms\linux-2\"mkdir c:\temp\vms\linux-0\
mkdir c:\temp\vms\linux-1\
mkdir c:\temp\vms\linux-2\

New-VHD -Path c:\temp\vms\linux-0\linux-0.vhdx -SizeBytes 20GB
New-VHD -Path c:\temp\vms\linux-1\linux-1.vhdx -SizeBytes 20GB
New-VHD -Path c:\temp\vms\linux-2\linux-2.vhdx -SizeBytes 20GB
```




