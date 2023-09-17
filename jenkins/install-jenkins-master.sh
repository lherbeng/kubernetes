#!/bin/bash

# Add the Jenkins key to the system keyring
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add the Jenkins apt repository entry
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the local package index
sudo apt-get update

# Install required dependencies (fontconfig and openjdk-11-jre)
sudo apt-get install -y fontconfig openjdk-11-jre

# Install Jenkins
sudo apt-get install -y jenkins

# Start Jenkins
sudo systemctl start jenkins

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

# Check the status
sudo systemctl status jenkins
