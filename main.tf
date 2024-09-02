


module "container_app_env" {
  source              = "./modules/container_app_env"
  name                = "containerappenv"
  location            = "East US" #azurerm_resource_group.rg-pokroy-tf-demo-01.location
  resource_group_name = azurerm_resource_group.rg-pokroy-tf-demo-01.name
  tags = {
    enviroment = "testing"
    owner      = "pokroy"
  }
}

