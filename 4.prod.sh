#!/bin/bash
sudo apt update -y
sudo apt install docker.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
sudo systemctl enable docker


# Create a dedicated deployment user
sudo useradd -m -s /bin/bash deploy_user
sudo usermod -aG docker deploy_user


# Setup SSH Directory for Jenkins to connect
sudo su - deploy_user -c "mkdir -p ~/.ssh && chmod 700 ~/.ssh && touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
