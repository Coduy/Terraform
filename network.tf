resource "azurerm_virtual_network" "my_vnet_3" {
  name                = "my-vnet-3"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.rg-pokroy-tf-demo-01.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name

  tags = {
  environment = "testing"
  }
}
# Subnet 1
resource "azurerm_subnet" "my_subnet_1_vnet_3" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  virtual_network_name = azurerm_virtual_network.my_vnet_3.name
  address_prefixes     = ["10.10.0.0/24"]
}
# Subnet 2
resource "azurerm_subnet" "my_subnet_2_vnet_3" {
  name                 = "subnet-2"
  resource_group_name  = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  virtual_network_name = azurerm_virtual_network.my_vnet_3.name
  address_prefixes     = ["10.10.1.0/24"]
}
