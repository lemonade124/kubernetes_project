# kubernetes_project
Deploying a Kubernetes cluster in virtualbox using terraform/ansible

Set the virtualbox environment variable path in powershell - this is for terraform.
$env:PATH = $env:PATH + ";C:\Program Files\Oracle\VirtualBox"


https://registry.terraform.io/providers/terra-farm/virtualbox/latest/docs
Create the terraform main file for the 3 node k8s cluster. see terraform file for cluster.

Deployed ansible core host manually using ubuntu 2404
https://portal.cloud.hashicorp.com/vagrant/discover/generic/ubuntu2204

| hostname | ip |
| --- | --- |
| ansible-core | 10.0.1.2 |
| node-01 | 10.0.2.10 |
| node-02 | 10.0.2.20 |
| node-03 | 10.0.2.30 |


```
sudo apt upgrade
sudo apt install sshpass
sudo apt install pipx
```
## install ansible core
```
sudo apt install ansible-core
```
create folder inventory and playbook:
```
mkdir inventory 
cd .. 
mkdir playbook
cd ../inventory
```
create ini file for inventory
```
vi kube_inventory.yml
```

```
---
masternode:
  hosts:
    10.0.2.10:
workernodes:
  hosts:
    10.0.2.20
    10.0.2.30
  vars:
    ansible_user: vagrant
```

validate the inventory file:
ansible-inventory -i kube_inventory.yml --list

ping the master and workers group
ansible masternode -m ping -i kube_inventory.yml

ping didnt work so tried with explicit user/pass
```
ansible masternode -m ping -i kube_inventory.yml --extra-vars "ansible_user=test122 ansible_password=test123"

10.0.2.10 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```

Tried the same on the worker nodes but it failed
```
ansible workernodes -m ping -i kube_inventory.yml --extra-vars "ansible_user=test123 ansible_password=test123"
```
went back and noticed my formatting was wrong

updated formatting:
```
---
masternode:
  hosts:
    10.0.2.10:
workernodes:
  hosts:
    10.0.2.20:
    10.0.2.30:
  vars:
    ansible_user: test123

```
ping still failed as I had to add the ssh fingerprint. after testing them one at a time and failing it worked with explicit user/password

updated yaml to include the ssh user variable

```
---
masternode:
  hosts:
    10.0.2.10:
  vars:
    ansible_user: test123
workernodes:
  hosts:
    10.0.2.20:
    10.0.2.30:
  vars:
    ansible_user: test123
```

Then running the following and entering the password, it worked.
```
ansible workernodes -m ping -i kube_inventory.yml -k
```

### Create playbook
