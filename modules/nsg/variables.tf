variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "location" {
  description = "Azure region where the NSG should be created"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the NSG should be created"
  type        = string
}