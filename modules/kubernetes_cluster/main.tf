# Kubernetes Cluster
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

  kubernetes_version = "1.27.9" 

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = tls_private_key.ssh_key.public_key_openssh
    }
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}

# Generate SSH Key Pair
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Optionally output the private key (sensitive)
output "ssh_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

# Optionally output the public key (non-sensitive)
output "ssh_public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}

