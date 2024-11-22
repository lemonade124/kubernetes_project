# kubernetes_project
Deploying a Kubernetes cluster in virtualbox using terraform/ansible

Set the virtualbox environment variable path in powershell
$env:PATH = $env:PATH + ";C:\Program Files\Oracle\VirtualBox"

https://registry.terraform.io/providers/terra-farm/virtualbox/latest/docs
Create the terraform main file for the 3 node k8s cluster

Deployed ansible core host manually using ubuntu 2404


| hostname | ip |
| --- | --- |
| ansible-core | 10.0.1.2 |
| node-01 | 10.0.2.10 |
| node-02 | 10.0.2.20 |
| node-03 | 10.0.2.30 |


on ansible-core install pipx
sudo apt upgrade
sudo apt install pipx

## install ansible core
pipx install ansible-core
