terraform {
  required_version = ">= 1.6.5"

  required_providers {
    azapi = {
      source = "Azure/azapi"
      version = "1.12.0"
    }
  }
}
