variable "vm_name" {
  description = "The name of the VM"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the VM"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the VM will be deployed"
  type        = string
}

variable "vm_size" {
  description = "The size of the VM"
  type        = string
  default     = "B1s"
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "ssh_public_key" {
  description = "The SSH public key for the VM"
  type        = string
}

variable "network_interface_ids" {
  description = "List of network interface IDs associated with the VM"
  type        = list(string)
}

variable "create_resource" {
  description = "Whether to create the Linux VM resource or not"
  type        = number
  default     = 1
}


