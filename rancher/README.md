## RKE2 deployment automation with Jenkins pipeline

**Create a script to install the RKE2 in your master and worker node including Jenkinsfile.**

- install_rke2_master.sh
- install_rke2_worker1.sh
- install_rke2_worker2.sh
- Jenkinsfile

**Create a New Jenkins Pipeline Job**

Log in to your Jenkins web interface > Click on "New Item" to create a new Jenkins job.
  
![image](https://github.com/lherbeng/kubernetes/assets/72662912/b102f286-5c54-4086-869b-33f9ac09336a)

Enter a name for your job (e.g., "RKE2 Automation") > Choose the "Pipeline" project type > Click "OK" to create the job.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/66153ab3-c496-4fc7-9b67-3c0c9be02004)

**Configure the Pipeline Job**

Under the "General" section, you can configure parameters and other general settings as needed.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/67e7a9ff-56c9-4c32-abe0-042fa8040878)

In the "Pipeline" section, choose "Pipeline script from SCM" as the definition. This allows you to define the pipeline script in your source code repository.


Select

![image](https://github.com/lherbeng/kubernetes/assets/72662912/617f9d9d-8fc9-4655-99eb-79f5bde8927e)


![image](https://github.com/lherbeng/kubernetes/assets/72662912/24db037b-9797-42b1-a96c-ca0e06cdf69b)


To create token, go to Settings > Developer Settings > Click Generate new token (classic)

![image](https://github.com/lherbeng/kubernetes/assets/72662912/1c2c36e2-1333-4ca1-a7e9-ac3f926cb8eb)

Enter your New personal access token (classic) > Click Generate Token button.

![image](https://github.com/lherbeng/kubernetes/assets/72662912/59c07974-3cb1-4b0e-980b-31fdb01fe7d0)



