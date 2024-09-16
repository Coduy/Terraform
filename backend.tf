terraform {
  required_version = ">=1.0"
  
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "1.15.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}

}
provider "azapi" {
}