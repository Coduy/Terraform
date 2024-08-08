resource "azurerm_network_interface" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_allocation
    public_ip_address_id          = var.public_ip_address_id
  }

}
