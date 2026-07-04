variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-main"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "network_interface_id" {
  description = "ID of the network interface to associate with the virtual machine"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "ID of the subnet to associate with the virtual machine"
  type        = string
  default     = ""
}

variable "network_interface_name" {
  description = "Name of the network interface"
  type        = string
  default     = "nic-main"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}