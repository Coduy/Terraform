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


variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "westeurope"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "example-vnet"
}

variable "address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "example-subnet"
}

variable "subnet_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "subnet3_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.10.10.0/24"]
}


variable "replication_type" {
  description = "type of replication LSR o GRS"
  type        = string
  default     = "LRS"
}

variable "storage_name" {
  description = "unique storage name"
  type        = string
  default     =  "sgpokroytfdemo02"

}

variable "storage_tier" {
  description = "storage type, for example: Standard o Premium"
  type        = string
  default     = "Standard"
}

variable "create_resource"{
  description = "whether to create the resourece or not"
  type = string
  default = "0"
}

variable "NSG_NIC_LINK"{
  type = bool
  default = true # puede ser overriddene by pipeline
}



