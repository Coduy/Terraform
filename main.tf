module "vnet-2" {
  source              = "./modules/network"
  vnet_name           = "vnet-2"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
}

module "subnet-2" {
  source               = "./modules/subnet"
  subnet_name          = "subnet-2"
  resource_group_name  = module.vnet-2.resource_group_name
  virtual_network_name = module.vnet-2.vnet_name
  subnet_prefixes      = var.subnet_prefixes
}

module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = "my-nsg"
  location            = azurerm_resource_group.rg-pokroy-tf-demo-01.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
}

# NIC Module
module "nic" {
  source                = "./modules/nic"
  name                  = "nic"
  location              = "West Europe"
  resource_group_name   = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  subnet_id             = module.subnet-2.subnet_id
  private_ip_allocation = "Dynamic"
  public_ip_address_id  = module.public_ip.public_ip_id
  nsg_id                = module.nsg.nsg_id #var.NSG_NIC_LINK ? module.nsg.nsg_id : null
}






resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = module.nic.network_interface_id
  network_security_group_id = module.nsg.nsg_id
}


module "container_app_env" {
  source              = "./modules/container_app_env"
  name                = "containerappenv"
  location            = "East US" #azurerm_resource_group.rg-pokroy-tf-demo-01.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  tags = {
    enviroment = "testing"
    owner      = "pokroy"
  }
}

