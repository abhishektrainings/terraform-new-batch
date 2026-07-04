variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create or use"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "Address prefix for the subnet"
}