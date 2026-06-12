#!/bin/bash
sudo apt update -y
sudo apt install openjdk-17-jre git wget curl gnupg lsb-release -y


# Install Docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker


# Create Jenkins user and add to Docker group (critical for building images without sudo)
sudo useradd -m -s /bin/bash jenkins
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu


# Install Trivy (Vulnerability Scanner)
sudo mkdir -p /usr/share/keyrings
wget -qO- https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y
