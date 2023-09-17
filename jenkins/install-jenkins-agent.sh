#!/bin/bash
JENKINS_SERVER ='http://192.168.254.182'
JENKINS_PORT =8080

# Install Java (required for Jenkins agent)
sudo apt update
sudo apt install default-jdk -y

# Create a directory for Jenkins agent
sudo mkdir -p /var/lib/jenkins/agent

# Download Jenkins agent JAR file
wget "${JENKINS_SERVER}:${JENKINS_PORT}/jnlpJars/agent.jar" -O /var/lib/jenkins/agent/agent.jar
# Replace "your-jenkins-server," "port," and "agent-name" with your Jenkins server's information.

# Create a Jenkins agent service file
sudo tee /etc/systemd/system/jenkins-agent.service <<EOF
[Unit]
Description=Jenkins Agent
After=network.target

[Service]
ExecStart=/usr/bin/java -jar /var/lib/jenkins/agent/agent.jar -jnlpUrl http://your-jenkins-server:port/computer/agent-name/slave-agent.jnlp
# Replace "your-jenkins-server," "port," and "agent-name" with your Jenkins server's information.

User=jenkins-agent
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd to pick up the new service
sudo systemctl daemon-reload

# Start the Jenkins agent service
sudo systemctl start jenkins-agent

# Enable the Jenkins agent service to start on boot
sudo systemctl enable jenkins-agent

# Check the status of the Jenkins agent service
sudo systemctl status jenkins-agent
