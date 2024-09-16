variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location for all resources"
  type        = string
  default     = "East US"
}

variable "ssh_key_name" {
  description = "SSH Key name"
  type        = string
}

variable "cluster_name" {
  description = "Kubernetes cluster name"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for Kubernetes cluster"
  type        = string
}

variable "admin_username" {
  description = "Admin username for Kubernetes nodes"
  type        = string
}

variable "vm_size" {
  description = "VM size for Kubernetes nodes"
  type        = string
  default     = "Standard_B2ms"
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 1
}

variable "node_pool_name" {
  description = "The name of the default node pool in the AKS cluster"
  type        = string
}

