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
  resource_group_name   = module.virtual_network.resource_group_name
  virtual_network_name  = module.virtual_network.vnet_name
  subnet_prefixes       = var.subnet_prefixes
}


# rendering storage template
data "template_file" "storage_config"{
    template = file("${path.module}/templates/storage_config.tpl")
    vars = {
        storage_name = var.storage_name
        replication_type = var.replication_type
        storage_tier = var.storage_tier
    }
}

# Create the storage account using the rendered values (assuming a simpler direct use)
resource "azurerm_storage_account" "example" {
  name                     = var.storage_name
  resource_group_name      = var.resource_group_name
  location                 = var.region
  account_tier             = var.storage_tier
  account_replication_type = var.replication_type

}