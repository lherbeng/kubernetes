## Setup Jenkins

This is the Debian package repository of Jenkins to automate installation and upgrade [Jenkins Debian Packages](https://pkg.origin.jenkins.io/debian-stable/).

***Run the jenkinsinstallation.sh script***

![image](https://github.com/lherbeng/kubernetes/assets/72662912/cf842cda-f801-4df8-96ef-81191934068d)

![image](https://github.com/lherbeng/kubernetes/assets/72662912/1fd88e09-1cdd-42f4-a06f-b2aa03f96e0d)

***Jenkins should now be installed and running in your WSL 2 Ubuntu instance. Access the Jenkins web interface by opening your web browser and navigating to http://192.168.254.182:8080. Follow the setup wizard to complete the Jenkins installation.***

![image](https://github.com/lherbeng/kubernetes/assets/72662912/f33d98f9-d457-487b-ac27-4e84519e25f1)

***To get the password via command line***

![image](https://github.com/lherbeng/kubernetes/assets/72662912/22de9f9e-14c8-4a43-b507-d4466f0c241e)

***Select Install suggested plugins***

![image](https://github.com/lherbeng/kubernetes/assets/72662912/0bd8d5e1-f33d-4e92-9909-73ead1558aaa)

***Create First Admin User***

![image](https://github.com/lherbeng/kubernetes/assets/72662912/763b8466-38cf-4989-bf40-760e9a315341)

***Jenkins URL***

![image](https://github.com/lherbeng/kubernetes/assets/72662912/f30cd2f7-d1fd-4717-9139-aaabf69bca38)

***Click on "Manage Jenkins" > "Manage Plugins" > "Available.***

***Search for and install the following plugins:***
   
- Kubernetes
- Docker Pipeline
- Rancher

***Create a slave or agent for workernode1***

Select "Set up an agent"

![image](https://github.com/lherbeng/kubernetes/assets/72662912/6b3ed470-e15d-47fd-bac7-1d43b1ab7f1f)

![image](https://github.com/lherbeng/kubernetes/assets/72662912/1395038c-70dc-462c-8953-85250008b425)


***Manually Create the Remote Root Directory:***

The "Remote root directory" in the context of creating a Jenkins agent (also known as a Jenkins slave) is the directory path on the agent machine where Jenkins will store and execute job-related files and workspace for jobs running on that agent. It's essentially the workspace directory for the agent.

Before configuring the Jenkins agent, log in to the agent machine and create the "Remote root directory" manually. You can use the mkdir command to create the directory. 

![image](https://github.com/lherbeng/kubernetes/assets/72662912/8450152d-ce29-4e08-8d07-0a45a3b37dee)

***Remote Root Directory is Mandatory***

![image](https://github.com/lherbeng/kubernetes/assets/72662912/6b78b0c4-29d0-4fcb-b564-86b721804b63)





