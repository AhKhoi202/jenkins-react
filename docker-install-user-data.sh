#!/bin/bash

# Update package lists
sudo apt-get update

# Install required certificates and curl
sudo apt-get install -y ca-certificates curl

# Create keyrings directory
sudo install -m 0755 -d /etc/apt/keyrings

# Download and import Docker's official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package lists again
sudo apt-get update

# Install Docker packages
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

# Enable Docker service to start on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Start Docker service
sudo systemctl start docker