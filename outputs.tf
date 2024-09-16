output "kube_config" {
  value     = module.kubernetes_cluster.kube_config
  sensitive = true
}

