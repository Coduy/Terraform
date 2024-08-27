resource "azurerm_resource_group" "rg-pokroy-tf-demo-01" {
  name     = "rg-pokroy-tf-demo-01"
  location = var.region

    tags = {
    environment = "${var.project}-${var.environment}"
  }
}
