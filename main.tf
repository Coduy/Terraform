module "network" {
  source              = "./modules/network"  # or use a Git URL or Terraform Registry URL
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  subnet_name         = var.subnet_name
  subnet_prefixes     = var.subnet_prefixes
}


module "network" {
  source              = "./modules/network"  # or use a Git URL or Terraform Registry URL
  vnet_name           = "vamos-test-net"
  address_space       = ["192.168.0.0/16"]
  location            = "WestEurope"
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  subnet_name         = "subnet-peuqeño"
  subnet_prefixes     = ["192.168.0.0/24"]
}