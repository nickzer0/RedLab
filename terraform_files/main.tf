# Define our ESXi variables from variables.tf
provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

# Domain Controller
resource "esxi_guest" "dc1" {
  guest_name = "dc1"
  disk_store = var.esxi_datastore
  guestos    = "windows9srv-64"
  boot_disk_type = "thin"
  memsize            = "8192"
  numvcpus           = "2"
  resource_pool_name = "/"
  power              = "on"
  clone_from_vm = "WindowsServer2016"
  # This is the network that bridges your host machine with the ESXi VM
  network_interfaces {
    virtual_network = var.vm_network
    mac_address     = "00:50:56:a1:b1:c1"
    nic_type        = "e1000"
  }
  # This is the local network that will be used for VM comms
  network_interfaces {
    virtual_network = var.hostonly_network
    mac_address     = "00:50:56:a1:b2:c1"
    nic_type        = "e1000"
  }
  guest_startup_timeout  = 45
  guest_shutdown_timeout = 30
}

# Workstation 1
resource "esxi_guest" "workstation1" {
  guest_name = "workstation1"
  disk_store = var.esxi_datastore
  guestos    = "windows9-64"
  boot_disk_type = "thin"
  memsize            = "8192"
  numvcpus           = "2"
  resource_pool_name = "/"
  power              = "on"
  clone_from_vm = "Windows10"
  # This is the network that bridges your host machine with the ESXi VM
  network_interfaces {
    virtual_network = var.vm_network
    mac_address     = "00:50:56:a2:b1:c3"
    nic_type        = "e1000"
  }
  # This is the local network that will be used for VM comms
  network_interfaces {
    virtual_network = var.hostonly_network
    mac_address     = "00:50:56:a2:b2:c3"
    nic_type        = "e1000"
  }
  guest_startup_timeout  = 45
  guest_shutdown_timeout = 30
}

# Workstation 2
resource "esxi_guest" "workstation2" {
  guest_name = "workstation2"
  disk_store = var.esxi_datastore
  guestos    = "windows9-64"
  boot_disk_type = "thin"
  memsize            = "8192"
  numvcpus           = "2"
  resource_pool_name = "/"
  power              = "on"
  clone_from_vm = "Windows10"
  # This is the network that bridges your host machine with the ESXi VM
  network_interfaces {
    virtual_network = var.vm_network
    mac_address     = "00:50:56:a2:b1:c4"
    nic_type        = "e1000"
  }
  # This is the local network that will be used for VM comms
  network_interfaces {
    virtual_network = var.hostonly_network
    mac_address     = "00:50:56:a2:b2:c4"
    nic_type        = "e1000"
  }
  guest_startup_timeout  = 45
  guest_shutdown_timeout = 30
}

# Logger
resource "esxi_guest" "logger" {
  guest_name = "logger"
  disk_store = var.esxi_datastore
  guestos    = "ubuntu-64"

  boot_disk_type = "thin"

  memsize            = "4096"
  numvcpus           = "2"
  resource_pool_name = "/"
  power              = "on"
  clone_from_vm = "Ubuntu2004"

    provisioner "remote-exec" {
    inline = [
      "sudo ifconfig eth0 up && echo 'eth0 up' || echo 'unable to bring eth0 interface up",
      "sudo ifconfig eth1 up && echo 'eth1 up' || echo 'unable to bring eth1 interface up"
    ]

    connection {
      host        = self.ip_address
      type        = "ssh"
      user        = "vagrant"
      password    = "vagrant"
    }
  }
  # Bridge network
  network_interfaces {
    virtual_network = var.vm_network
    mac_address     = "00:50:56:a3:b1:c9"
    nic_type        = "e1000"
  }
  # This is the local network that will be used for VM comms
  network_interfaces {
    virtual_network = var.hostonly_network
    mac_address     = "00:50:56:a3:b2:c9"
    nic_type        = "e1000"
  }
  guest_startup_timeout  = 45
  guest_shutdown_timeout = 30
}
