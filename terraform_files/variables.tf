variable "esxi_hostname" {
  default = "<IP>"
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
  default = "datastore"
}

variable "vm_network" {
  default = "VM Network"
}

variable "hostonly_network" {
  default = "HostOnly"
}
