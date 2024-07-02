terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "rg-backend-tf"
      storage_account_name = "terraformpokroytesting"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
   features {}

  subscription_id = "4c6a923c-ddba-4a3e-8060-3b3d4628f8b5"
  tenant_id = "8a7b0d3b-e15d-4cce-95c6-1a4a69f0c440"
  client_id = "6ecbe7f3-dcc1-46a7-bf6b-134bd5e72772"
  client_secret = "iu78Q~fwSzHEk2~1OnS7FzTF0.-MFYpZzQ5lTc15"
}

