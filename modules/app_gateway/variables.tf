variable "name" {
  description = "The name of the Application Gateway."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location/region where the Application Gateway should be created."
  type        = string
}

variable "sku_name" {
  description = "The name of the SKU."
  type        = string
  default     = "Standard_v2"
}

variable "sku_tier" {
  description = "The tier of the SKU."
  type        = string
  default     = "Standard_v2"
}

variable "sku_capacity" {
  description = "The capacity of the SKU."
  type        = number
  default     = 2
}

variable "subnet_id" {
  description = "The ID of the subnet."
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address."
  type        = string
}

variable "frontend_port" {
  description = "The frontend port number."
  type        = number
  default     = 80
}

variable "protocol" {
  description = "The protocol to use for HTTP listeners."
  type        = string
  default     = "Http"
}

variable "backend_ip_address" {
  description = "The IP address of the backend pool."
  type        = string
  default     = ""
}

variable "backend_port" {
  description = "The backend port number."
  type        = number
  default     = 80
}

variable "backend_protocol" {
  description = "The protocol to use for backend HTTP settings."
  type        = string
  default     = "Http"
}

variable "cookie_based_affinity" {
  description = "Enable or disable cookie-based affinity."
  type        = string
  default     = "Disabled"
}

variable "tags" {
  description = "Tags to apply to the Application Gateway."
  type        = map(string)
  default     = {}
}
