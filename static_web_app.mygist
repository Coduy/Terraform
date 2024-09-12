resource "azurerm_static_web_app" "web-pokroy-tf-demo" {
  name                = "web-pokroy-tf-demo"
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  location            = azurerm_resource_group.rg-pokroy-tf-demo-01.location
  sku_tier = "Free"
  sku_size = "Free"
  
  tags = {
    environment = "${var.project}-${var.environment}"
  }


}