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


ping test nodes from ansible core
on ansible-core install
sudo apt upgrade
sudo apt install pipx

## install ansible core
sudo apt install ansible-core

create folder inventory and playbook:
mkdir inventory 
cd .. 
mkdir playbook
cd ../inventory

create ini file for inventory
vi kube_inventory.yml

```
---
masternode:
  hosts:
    10.0.2.10
workernodes:
  hosts:
    10.0.2.20
    10.0.2.30
  vars:
    ansible_user: vagrant
```

validate the inventory file:
ansible-inventory -i kube_inventory.ini --list

ping the master and workers group
ansible master -m ping -i i
