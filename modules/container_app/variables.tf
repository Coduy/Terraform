variable "name" {
  description = "Name of the Container App"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which the Container App will be created"
  type        = string
}

variable "container_image" {
  description = "Docker image to deploy in the Container App"
  type        = string
}

variable "cpu" {
  description = "Number of CPU cores for the Container App"
  type        = number
  default     = 0.25
}

variable "memory" {
  description = "Amount of memory in GB for the Container App"
  type        = number
}

variable "environment_id" {
  description = "ID of the Azure Container App Environment"
  type        = string
}

variable "ingress" {
  description = "Ingress configuration for the Container App"
  type        = object({
    external         = bool
    target_port      = number
    transport        = string
    allow_unauthenticated = bool
  })
  default = {
    external              = true
    target_port           = 80
    transport             = "auto"
    allow_unauthenticated = false
  }
}
