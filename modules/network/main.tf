resource "azurerm_virtual_network" "vnet" {
  name                =  var.vnet_name
  address_space       =  var.address_space
  location            =  var.location
  resource_group_name =  var.resource_group_name

  tags = {
  environment = "testing"
  }
}
# Subnet 1
resource "azurerm_subnet" "subnet_1" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefixes
}