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
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
source ~/.profile


# instal kind
echo "Installing Kind..."
go install sigs.k8s.io/kind@v0.14.0
echo "export PATH=\$PATH:$(go env GOPATH)/bin" >> ~/.profile

# install docker 
echo "Installing docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh
# manage docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 

# install az
echo "Installing az cli..."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az extension add --name connectedk8s

# install kubectl
echo "Installing kubectl..."
snap install kubectl --classic
sudo snap install kubectx --classic

# install helm3
echo "Installing helm3..."
wget "https://get.helm.sh/$helmtar"
tar -zxvf $helmtar
sudo mv linux-arm/helm /usr/local/bin/helm
