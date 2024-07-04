resource "azurerm_storage_account" "sg-pokroy-tf-demo" {
  name                     = "sgpokroytfdemo"
  resource_group_name      = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  location                 = azurerm_resource_group.rg-pokroy-tf-demo-01.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}