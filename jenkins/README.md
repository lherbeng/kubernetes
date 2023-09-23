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

click workernode1-agent

![image](https://github.com/lherbeng/kubernetes/assets/72662912/3a16a98c-572a-44b4-9755-66c8883adc94)

It will show you on how to Run from agent command line

![image](https://github.com/lherbeng/kubernetes/assets/72662912/b2e126ef-6aa3-4663-b094-f9f7227e7438)

![image](https://github.com/lherbeng/kubernetes/assets/72662912/4cbc0392-5098-4d0a-babf-343311a017cb)

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

## Create a pipeline

In your Jenkins dashboard, click on "New Item."

![image](https://github.com/lherbeng/kubernetes/assets/72662912/6697ba3e-a277-42d8-a0e6-651d7e1be3a7)

Enter a name for your pipeline job (e.g., "My Jenkins Agent Installation"). Select "Pipeline" as the project type and click "OK."

![image](https://github.com/lherbeng/kubernetes/assets/72662912/ea793dc4-741e-44d7-bb06-d1c47bb3c99f)

## Configure the Pipeline Job

In the "General" section, you can provide a description for your pipeline job.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/cd100a99-aa4f-40d6-b9f1-90c87a747a6a)

In the "Pipeline" section, select the "Pipeline script from SCM" option. Choose "Git" as the SCM. In the "Repository URL," enter the URL of your GitHub repository where the Jenkinsfile and Bash script are stored.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/67060c46-6000-45ec-8c9c-1f52b0551ca2)

Under "Branches to build," enter the branch name you want to build (usually "main" or "master"). In the "Script Path," specify the path to your Jenkinsfile in the repository (e.g., Jenkinsfile). Click "Save" to save your job configuration.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/a0739398-2ef1-4e71-8e1f-9850dc21bfdb)




