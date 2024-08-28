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
  name                  = "nic"
  location              = "West Europe"
  resource_group_name   = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  subnet_id             = module.subnet-2.subnet_id
  private_ip_allocation = "Dynamic"
  public_ip_address_id  = module.public_ip.public_ip_id
  nsg_id = var.NSG_NIC_LINK ? module.nsg.nsg_id : null
}


# Linux VM Module
module "linux_vm" {
  create_resource     = var.create_resource
  source              = "./modules/linux_vm"
  vm_name             = "my-linux-vm"
  location            = azurerm_resource_group.rg-pokroy-tf-demo-01.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  subnet_id           = module.subnet-2.subnet_id
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
  name                = "pub-ip"
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

# 2ND VNET

module "vnet-1" {
  source              = "./modules/network"
  vnet_name           = "vnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
}

module "subnet-1" {
  source                = "./modules/subnet"
  subnet_name           = "subnet1"
  resource_group_name   = module.vnet-1.resource_group_name
  virtual_network_name  = module.vnet-1.vnet_name
  subnet_prefixes       = var.subnet_prefixes
}