output "admin_username" {
  value = azurerm_linux_virtual_machine.vm.admin_username
}

output "public_ip_address" {
  value = azurerm_network_interface.nic.private_ip_address
}
