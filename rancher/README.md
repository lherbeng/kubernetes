## RKE2 deployment automation with Jenkins pipeline

**Prerequisites:**

- Three Linux nodes, typically virtual machines, in the infrastructure provider of your choice.
- A load balancer to direct traffic to the two nodes.
- A DNS record to map a URL to the load balancer. This will become the Rancher server URL, and downstream Kubernetes clusters will need to reach it.
  
**Create a script to install the RKE2 in your master and worker node including Jenkinsfile.**

- install_rke2_master.sh
- install_rke2_worker1.sh
- install_rke2_worker2.sh
- Jenkinsfile
- install_nginx_loadbalancer.sh

**Create a New Jenkins Pipeline Job**

Log in to your Jenkins web interface > Click on "New Item" to create a new Jenkins job.
  
![image](https://github.com/lherbeng/kubernetes/assets/72662912/b102f286-5c54-4086-869b-33f9ac09336a)

Enter a name for your job (e.g., "RKE2 Automation") > Choose the "Pipeline" project type > Click "OK" to create the job.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/66153ab3-c496-4fc7-9b67-3c0c9be02004)

**Configure the Pipeline Job**

Under the "General" section, you can configure parameters and other general settings as needed.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/67e7a9ff-56c9-4c32-abe0-042fa8040878)

In the "Pipeline" section, choose "Pipeline script from SCM" as the definition. This allows you to define the pipeline script in your source code repository.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/09000a2a-6b74-4bef-8233-4dd3be645897)


Select Secret text from the drop down menu > Paste your newly created token in Secret > Enter your preffered ID > Click Save

![image](https://github.com/lherbeng/kubernetes/assets/72662912/24db037b-9797-42b1-a96c-ca0e06cdf69b)

Change the Branches to build from */master to */main > Script Path "rancher/Jenkinsfile" > Hit Save button

![image](https://github.com/lherbeng/kubernetes/assets/72662912/8eade637-452d-44c2-b877-a469c48f9f14)

**Additional Steps**

To create token, go to Settings > Developer Settings > Click Generate new token (classic)

![image](https://github.com/lherbeng/kubernetes/assets/72662912/1c2c36e2-1333-4ca1-a7e9-ac3f926cb8eb)

Enter your New personal access token (classic) > Click Generate Token button.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/59c07974-3cb1-4b0e-980b-31fdb01fe7d0)



