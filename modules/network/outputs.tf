# modules/virtual_network/outputs.tf
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}