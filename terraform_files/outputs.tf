output "logger_ips" {
  value = esxi_guest.logger.ip_address
}

output "dc1_ips" {
  value = esxi_guest.dc1.ip_address
}

output "workstation1_ips" {
  value = esxi_guest.workstation1.ip_address
}

output "workstation2_ips" {
  value = esxi_guest.workstation2.ip_address
}


resource "local_file" "AnsibleInventory" {
 content = templatefile("./inventory.tmpl",
 {
  logger_ip = esxi_guest.logger.ip_address,
  dc1_ip = esxi_guest.dc1.ip_address,
  workstation1_ip = esxi_guest.workstation1.ip_address,
  workstation2_ip = esxi_guest.workstation2.ip_address
 }
 )
 filename = "../ansible_files/inventory.yml"
}
