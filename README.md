# kubernetes_project
Deploying a Kubernetes cluster in virtualbox using terraform/ansible

Set the virtualbox environment variable path in powershell
$env:PATH = $env:PATH + ";C:\Program Files\Oracle\VirtualBox"

https://registry.terraform.io/providers/terra-farm/virtualbox/latest/docs
Create the terraform main file for the 3 node k8s cluster

Deployed ansible core host manually using ubuntu 2404

hostname: ansible-core 
ip: 10.0.1.2

hostname: node-01
ip: 10.0.2.10
hostname: node-02
ip: 10.0.2.20
hostname: node-03
ip: 10.0.2.30
