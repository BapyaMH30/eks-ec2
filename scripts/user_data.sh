#!/bin/bash
set -e

# Update system packages
yum update -y

# Install required packages
yum install -y \
    curl \
    unzip \
    jq \
    postgresql \
    git \
    docker

# Start and enable Docker service
systemctl start docker
systemctl enable docker

# Install AWS CLI (latest version)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install kubectl (latest stable version)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

# Verify installations
aws --version
git --version
kubectl version --client
helm version
docker --version
psql --version
jq --version

echo "Installation completed successfully!"

# Create a new user if it doesn't exist
if ! id "deployuser" &>/dev/null; then
    sudo useradd -m -s /bin/bash deployuser
    echo "deployuser ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/deployuser
    chmod 0440 /etc/sudoers.d/deployuser
fi

# Ensure the home directory has proper permissions
sudo chown -R deployuser:deployuser /home/deployuser

# Allow SSH login for the deployuser (copy SSH key from ec2-user)
sudo mkdir -p /home/deployuser/.ssh
sudo cp /home/ec2-user/.ssh/authorized_keys /home/deployuser/.ssh/authorized_keys
sudo chown -R deployuser:deployuser /home/deployuser/.ssh
sudo chmod 700 /home/deployuser/.ssh
sudo chmod 600 /home/deployuser/.ssh/authorized_keys

echo "deployuser can now execute sudo commands without a password."

# Check if EBS volume exists and format/mount it
if [ -b /dev/xvdf ]; then
    echo "Formatting and mounting additional EBS volume..."
    sudo mkfs -t ext4 /dev/xvdf
    sudo mkdir -p /data
    sudo mount /dev/xvdf /data
    echo "/dev/xvdf /data ext4 defaults,nofail 0 2" | sudo tee -a /etc/fstab
else
    echo "No additional EBS volume found, skipping format and mount..."
fi