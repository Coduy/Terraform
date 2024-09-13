module "storage_account" {
  source              = "./modules/storage"
  resource_group_name = "rg-pokroy-tf-demo-03"
  location            = "West Europe"
  storage_account_name = "pvcshare"
  fileshare_name      = "myfileshare"
  fileshare_quota     = 10
  tags = {
    environment = "production"
  }
}
