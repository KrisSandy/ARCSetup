## Azure commands
* Create a new vm - `az vm create --resource-group arc --name arc-k8 --image UbuntuLTS  --admin-username sandeep --generate-ssh-keys --size Standard_D4s_v3`
* Delete resoureGroup - `az group delete --name arc-k8`

## Installation script commands
* Get installation script - `wget https://raw.githubusercontent.com/KrisSandy/ARCSetup/main/setupvm.sh`
* Make script executable - `chmod +x setupvm.sh`
* Execute script - `.\setupvm.sh`
