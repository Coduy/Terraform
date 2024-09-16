output "kube_config" {
  value     = module.kubernetes_cluster.kube_config
  sensitive = true
}

output "generated_ssh_key" {
  value = module.ssh_key.public_key
}