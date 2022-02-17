variable "esxi_hostname" {
  default = "192.168.1.X"
}

variable "esxi_hostport" {
  default = "22"
}

variable "esxi_username" {
  default = "root"
}

variable "esxi_password" { 
  default = "<password>"
}

variable "esxi_datastore" {
  default = "<datastore>"
}

variable "vm_network" {
  default = "VM Network"
}

variable "hostonly_network" {
  default = "HostOnly"
}
