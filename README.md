## Azure commands
* create resource group - `az group create --name arc --location northeurope`
* Create a new vm - `az vm create --resource-group arc --name arc-k8 --image UbuntuLTS  --admin-username sandeep --generate-ssh-keys --size Standard_D4s_v3`
* Delete resoureGroup - `az group delete --name arc`
* Create a SP - `az ad sp create-for-rbac --name arcsp --role Contributor --scopes /subscriptions/f9a07ac9-dba1-4c4a-a89b-064f11d03386`

## Installation script commands
* Get installation script - `wget https://raw.githubusercontent.com/KrisSandy/ARCSetup/main/setupvm.sh`
* Make script executable - `chmod +x setupvm.sh`
* Execute script - `./setupvm.sh`

## ARC Setup
Once cluster is connected

* Add user to access cluster from anywhere - `kubectl create clusterrolebinding demo-user-binding --clusterrole cluster-admin --user=<objectid>`
* Run proxy connect server to access cluster - `az connectedk8s proxy -n AzureArcTest1 -g AzureArcTest`

## Kuberneties commands 
* Create a hello server - `kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4`
