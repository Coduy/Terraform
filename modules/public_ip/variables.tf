variable "name" {
  description = "Name of the public IP address"
  type        = string
}

variable "location" {
  description = "The location/region where the Public IP should exist"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Public IP"
  type        = string
}

variable "allocation_method" {
  description = "The method used to allocate the Public IP"
  type        = string
  default     = "Static"  # or "Dynamic"
}

variable "sku" {
  description = "The SKU of the Public IP"
  type        = string
  default     = "Basic"   # or "Standard"
}
