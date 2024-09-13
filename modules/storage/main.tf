provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name       = azurerm_resource_group.rg-pokroy-tf-demo-03.name
  location                  = azurerm_resource_group.rg-pokroy-tf-demo-03.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"

  tags = var.tags
}

resource "azurerm_storage_share" "fileshare" {
  name                 = var.fileshare_name
  storage_account_name = azurerm_storage_account.storage.name
  quota                = var.fileshare_quota
}

