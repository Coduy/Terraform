# modules/subnet/variables.tf
variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network the subnet belongs to"
  type        = string
}

variable "subnet_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
