resource "azurerm_resource_group" "rg-pokroy-tf-demo" {
  name     = "rg-pokroy-tf-demo"
  location = var.region

    tags = {
    environment = "${var.project}-${var.environment}"
  }
}
