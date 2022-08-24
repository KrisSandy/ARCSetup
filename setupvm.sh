#!/bin/bash

gotar=go1.19.linux-amd64.tar.gz
helmtar=helm-v3.6.3-linux-amd64.tar.gz

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

# create cluster
echo "Creating kubernetes cluster"
kind create cluster
echo "Created cluster"
sleep 3
