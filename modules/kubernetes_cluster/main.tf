resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = var.node_pool_name
    vm_size    = var.vm_size
    node_count = var.node_count
  }

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = module.ssh_key.public_key
    }
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}


