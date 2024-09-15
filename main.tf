module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "ssh_key" {
  source            = "./modules/ssh_key"
  ssh_key_name      = var.ssh_key_name
  location          = var.location
  resource_group_id = module.resource_group.resource_group_id
}

module "kubernetes_cluster" {
  source              = "./modules/kubernetes_cluster"
  cluster_name        = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  admin_username      = var.admin_username
  ssh_key             = azapi_resource_action.ssh_public_key_gen.output.publicKey
  vm_size             = var.vm_size
  node_count          = var.node_count
  node_pool_name = var.node_pool_name

}
