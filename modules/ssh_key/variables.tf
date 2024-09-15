variable "ssh_key_name" {
  type        = string
  description = "Name for the SSH key"
}

variable "location" {
  type        = string
  description = "Location for the SSH key"
}

variable "resource_group_id" {
  type        = string
  description = "Resource group ID where the SSH key will be created"
}

variable "ssh_key" {
  description = "SSH public key"
  type        = string
}
