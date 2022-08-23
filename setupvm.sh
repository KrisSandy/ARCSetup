#!/bin/bash

gotar=go1.19.linux-amd64.tar.gz
helmtar=helm-v3.6.3-linux-arm.tar.gz

sudo apt update -y
sudo apt upgrade -y

# install go 
echo "Installing go..."
wget "https://go.dev/dl/$gotar"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf $gotar
rm $gotar
export PATH=$PATH:/usr/local/go/bin
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
echo "Installed go"
sleep 3

# install docker 
echo "Installing docker..."
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
# curl -fsSL https://get.docker.com -o get-docker.sh
# sudo sh get-docker.sh
# rm get-docker.sh
# manage docker as a non-root user
# sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
echo "Installed docker"
sleep 3

# install az
echo "Installing az cli..."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az extension add --name connectedk8s
echo "Installed az cli"
sleep 3

# install kubectl
echo "Installing kubectl..."
sudo snap install kubectl --classic
sudo snap install kubectx --classic
echo "Installed kubectl"
sleep 3

# install helm3
echo "Installing helm3..."
wget "https://get.helm.sh/$helmtar"
tar -zxvf $helmtar
sudo mv linux-arm/helm /usr/local/bin/helm
rm $helmtar
rm -r linux-arm
echo "Installed helm3"
sleep 3

# instal kind
echo "Installing Kind..."
go install sigs.k8s.io/kind@v0.14.0
export PATH=$PATH:$(go env GOPATH)/bin
echo "export PATH=\$PATH:$(go env GOPATH)/bin" >> ~/.profile
echo "Installed kind"
sleep 3

echo "Creating kubernetes cluster"
kind create cluster
echo "Created cluster"
