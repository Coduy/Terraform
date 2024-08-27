variable "name" {
  description = "Name of the NIC"
  type        = string
}

variable "location" {
  description = "The location/region where the NIC should exist"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the NIC"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to which the NIC should be connected"
  type        = string
}

variable "private_ip_allocation" {
  description = "The IP allocation method for the private IP address"
  type        = string
  default     = "Dynamic"  # or "Static"
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address to associate with the NIC"
  type        = string
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration"
  type        = string
  default     = "internal"
}

variable "nsg_id" {
  description = "ID of the Network Security Group to associate with the NIC"
  type        = string
}