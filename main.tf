module "network_1" {
  source              = "./modules/network"  # or use a Git URL or Terraform Registry URL
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  subnet_name         = var.subnet_name
  subnet_prefixes     = var.subnet_prefixes
}


module "network_2" {
  source              = "./modules/network"  # or use a Git URL or Terraform Registry URL
  vnet_name           = "vamos-test-net"
  address_space       = ["192.168.0.0/16"]
  location            = "WestEurope"
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  subnet_name         = "subnet-peuqeño"
  subnet_prefixes     = ["192.168.0.0/24"]
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
  resource_group_name      = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  location                 = azurerm_resource_group.var.region
  account_tier             = var.storage_tier
  account_replication_type = var.replication_type

}