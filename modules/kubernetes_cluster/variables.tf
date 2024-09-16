variable "cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster"
}

variable "location" {
  type        = string
  description = "Location of the Kubernetes cluster"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the Kubernetes cluster"
}

variable "vm_size" {
  type        = string
  description = "VM size for the nodes"
  default     = "Standard_B2ms"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the cluster"
  default     = 1
}

variable "admin_username" {
  type        = string
  description = "Admin username for Linux VM"
}

variable "ssh_key" {
  type        = string
  description = "SSH public key"
}

variable "node_pool_name" {
  description = "The name of the default node pool in the AKS cluster"
  type        = string
}

variable "ssh_key" {
  type        = string
  description = "SSH public key"
}
