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

![image](https://github.com/lherbeng/kubernetes/assets/72662912/a8abb52c-33ba-4a05-8141-de3473a0503c)

<!-- Cod Box Copy begin -->
<link href="prism/prism.min.css" rel="stylesheet" />
<link href="code-box-copy/css/code-box-copy.css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
<script src="prism/prism.min.js"></script>
<script src="clipboard/clipboard.min.js"></script>
<script src="code-box-copy/js/code-box-copy.js"></script>
<!-- Cod Box Copy end -->

