variable "region" {
  description = "The Azure region to deploy to"
  type        = string
  default     = "westeurope"
}

variable "environment"{
    type = string
}


variable "project"{
    type = string
}