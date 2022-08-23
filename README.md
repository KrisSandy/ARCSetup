## Azure commands
* create resource group - `az group create --name arc --location northeurope`
* Create a new vm - `az vm create --resource-group arc --name arc-k8 --image UbuntuLTS  --admin-username sandeep --generate-ssh-keys --size Standard_D4s_v3`
* Delete resoureGroup - `az group delete --name arc`
* Create a SP - `az ad sp create-for-rbac --name arcsp --role Contributor --scopes /subscriptions/f9a07ac9-dba1-4c4a-a89b-064f11d03386`

## Installation script commands
* Get installation script - `wget https://raw.githubusercontent.com/KrisSandy/ARCSetup/main/setupvm.sh`
* Make script executable - `chmod +x setupvm.sh`
* Execute script - `./setupvm.sh`
