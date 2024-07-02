resource "azurerm_storage_account" "sg-pokroy-tf-demo" {
  name                     = "sgpokroytfdemo"
  resource_group_name      = azurerm_resource_group.rg-pokroy-tf-demo.name
  location                 = azurerm_resource_group.rg-pokroy-tf-demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}