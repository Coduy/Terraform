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

# NIC Module
module "nic" {
  source                = "./modules/nic"
  name                  = "example-nic"
  location              = "West Europe"
  resource_group_name   = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  subnet_id             = module.subnet-2.subnet_id
  private_ip_allocation = "Dynamic"
  public_ip_address_id  = module.public_ip.public_ip_id
  nsg_id = module.nsg.nsg_id
}


# Linux VM Module
module "linux_vm" {
  create_resource     = var.create_resource == "true" ? 1 : 0
  source              = "./modules/linux_vm"
  vm_name             = "my-linux-vm"
  location            = azurerm_resource_group.rg-pokroy-tf-demo-01.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  subnet_id           = module.subnet.subnet_id
  vm_size             = "Standard_B1s"
  admin_username      = "adminuser"
  ssh_public_key      = file("~/.ssh/id_rsa.pub")  # Path to your SSH public key
  network_interface_ids = [
    module.nic.network_interface_id
  ]

}

# Public IP Module
module "public_ip" {
  source              = "./modules/public_ip"
  name                = "example-public-ip"
  location            = azurerm_resource_group.rg-pokroy-tf-demo-01.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  allocation_method   = "Static"
  sku                 = "Basic"
}

module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = "my-nsg"
  location            = azurerm_resource_group.rg-pokroy-tf-demo-01.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
}
