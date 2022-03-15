variable "esxi_hostname" {
  default = "192.168.1.20"
}

variable "esxi_hostport" {
  default = "22"
}

variable "esxi_username" {
  default = "root"
}

variable "esxi_password" { 
  default = "p3nt3st3r"
}

variable "esxi_datastore" {
  default = "datastore"
}

variable "vm_network" {
  default = "VM Network"
}

variable "hostonly_network" {
  default = "HostOnly"
}
