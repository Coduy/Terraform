module "vnet-1" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
}

module "subnet" {
  source                = "./modules/subnet"
  subnet_name           = var.subnet_name
  resource_group_name   = module.vnet-1.resource_group_name
  virtual_network_name  = module.vnet-1.vnet_name
  subnet_prefixes       = var.subnet_prefixes
}

module "subnet-a" {
  source                = "./modules/subnet"
  subnet_name           = "lovely-dance"
  resource_group_name   = module.vnet-1.resource_group_name
  virtual_network_name  = module.vnet-1.vnet_name
  subnet_prefixes       = ["10.0.2.0/24"]
}



module "vnet-2" {
  source              = "./modules/network"
  vnet_name           = "vnet-2"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
}

module "subnet-2" {
  source                = "./modules/subnet"
  subnet_name           = "subnet-2"
  resource_group_name   = module.vnet-2.resource_group_name
  virtual_network_name  = module.vnet-2.vnet_name
  subnet_prefixes       = var.subnet_prefixes
}


# Linux VM Module
module "linux_vm" {
  source              = "./modules/linux_vm"
  vm_name             = "my-linux-vm"
  location            = azurerm_resource_group.rg-pokroy-tf-demo-01.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  subnet_id           = module.subnet.subnet_id
  vm_size             = "Standard_B1s"
  admin_username      = "adminuser"
  ssh_public_key      = file("~/.ssh/id_rsa.pub")  # Path to your SSH public key
}