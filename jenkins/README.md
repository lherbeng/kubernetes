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

Enter workernode1-agent for the Node name then hit create button

![image](https://github.com/lherbeng/kubernetes/assets/72662912/1395038c-70dc-462c-8953-85250008b425)


***Manually Create the Remote Root Directory:***

The "Remote root directory" in the context of creating a Jenkins agent (also known as a Jenkins slave) is the directory path on the agent machine where Jenkins will store and execute job-related files and workspace for jobs running on that agent. It's essentially the workspace directory for the agent.

Before configuring the Jenkins agent, log in to the agent machine and create the "Remote root directory" manually. You can use the mkdir command to create the directory. 

![image](https://github.com/lherbeng/kubernetes/assets/72662912/8450152d-ce29-4e08-8d07-0a45a3b37dee)

***Remote Root Directory is Mandatory***

![image](https://github.com/lherbeng/kubernetes/assets/72662912/83f442e7-192a-4b08-afc3-46898bc098bd)

Hit save button when you're done

![image](https://github.com/lherbeng/kubernetes/assets/72662912/22acd25d-ac45-4ddb-8bda-0e57afe19b5e)

The workernode1-agent is currently offline. click workernode1-agent

![image](https://github.com/lherbeng/kubernetes/assets/72662912/3a16a98c-572a-44b4-9755-66c8883adc94)

It will show you on how to Run from agent command line.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/b2e126ef-6aa3-4663-b094-f9f7227e7438)

![image](https://github.com/lherbeng/kubernetes/assets/72662912/4cbc0392-5098-4d0a-babf-343311a017cb)

Run the command in workernode1, go to the Remote root directory /var/lib/jenkins/agents/worker-node-1.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/ae592421-a244-4e94-8f82-e231215047f5)

If you encounter the Command 'java' not found, but can be installed with error, install the java.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/8cf33e14-5676-44ba-9e19-cbf6e5d09fc0)

Try to re-run the command and you will be able to see that it is connected.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/2d178741-3d32-4d5c-9db1-b27c01210ff0)

Check the Agent workernode1-agent and it is now online, repeat the same process if you want to add another workernode-agent

![image](https://github.com/lherbeng/kubernetes/assets/72662912/ad701a43-ff0f-421e-bc99-0ef4018b8dc1)

## Configure Jenkins for GitHub Integration

In your Jenkins dashboard, click on "Manage Jenkins" in the left sidebar.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/445e727e-557b-4dd9-bf81-963a962bbe3e)

Click on "Manage Plugins.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/9a14772c-8dab-4ee0-be53-d1d7e813f2b2)

In the "Available" tab, search for and install the "GitHub plugin" plugin. This plugin integrates GitHub to Jenkins.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/35123cd5-af2d-401c-954c-72d49b38ef38)

Once the plugin is installed, go to "Manage Jenkins" > "Configure System."

![image](https://github.com/lherbeng/kubernetes/assets/72662912/c9c27ffc-b0bd-412e-a80b-7dbd74ba0831)

Scroll down to the "GitHub" section and configure the GitHub server settings. You'll need to provide your GitHub credentials (or a Personal Access Token) and click "Add GitHub Server."

![image](https://github.com/lherbeng/kubernetes/assets/72662912/c8629dfd-b691-40ea-80a5-b2b090f3449f)

Paste the token you created in Github and enter the github-PAT for the ID then hit save button.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/96d53148-7f61-4a5a-9a4d-7f2d758fb2eb)

Under Credentials select github-PAT then hit Test connection button. Credentials verified for user lherbeng, rate limit: 4999. It specifies the rate limit and how many API calls I have left. It's set to 5000 and I just used one to test connection so have 4999 api calls remaining before I'm rate limited.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/c542b6df-5fcb-4945-adf0-66c7151205be)

