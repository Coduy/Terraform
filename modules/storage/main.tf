provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = "NorthEurope"
  account_tier              = "Standard"
  account_replication_type  = "LRS"

  tags = var.tags
}

resource "azurerm_storage_share" "fileshare" {
  name                 = var.fileshare_name
  storage_account_name = azurerm_storage_account.storage.name
  quota                = var.fileshare_quota
}

