module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}


module "kubernetes_cluster" {
  source              = "./modules/kubernetes_cluster"
  cluster_name        = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  admin_username      = var.admin_username
  vm_size             = var.vm_size
  node_count          = var.node_count
  node_pool_name = var.node_pool_name
}
