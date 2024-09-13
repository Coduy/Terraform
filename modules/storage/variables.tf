variable "location" {
  description = "The Azure region in which to create resources."
  type        = string
}

variable "resource_group_name" {
  description = "The Azure region in which to create resources."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account to create. Must be globally unique."
  type        = string
}

variable "fileshare_name" {
  description = "The name of the file share to create."
  type        = string
}

variable "fileshare_quota" {
  description = "The quota of the file share in GB."
  type        = number
  default     = 5  # Default to 5GB
}

variable "tags" {
  description = "Tags to apply to the resources."
  type        = map(string)
  default     = {}
}
