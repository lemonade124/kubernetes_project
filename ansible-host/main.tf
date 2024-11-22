terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}


resource "virtualbox_vm" "node" {
  count     = 1
  name      = format("ansible-%02d", count.index + 1)
  image     = "/vscode/k8s-project/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  cpus      = 2
  memory    = "512 mib"
  #user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "bridged"
    host_interface = "network-adapter-name"
  }
}

output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}
