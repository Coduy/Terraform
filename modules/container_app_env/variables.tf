variable "name" {
  description = "The name of the Container Apps Environment."
  type        = string
}

variable "location" {
  description = "The Azure region where the Container Apps Environment will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Container Apps Environment will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}