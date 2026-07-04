// Variables for Terraform configuration (generated to match typical Azure Batch main.tf)
variable "resource_group_name" {
  description = "Name of the resource group to create or use"
  type        = string
  default     = "rg-main"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "vnet-main"
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "subnet-main"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    environment = "dev"
    ManagedBy   = "Terraform"
    Owner       = "abhishektraining30@gmail.com"
    Impact      = "low"
  }
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "vm-main"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  sensitive   = true
  default     = "P@ssw0rd1234!"
}

variable "subnet_id" {
  description = "ID of the subnet to associate with the virtual machine"
  type        = string
  default     = ""
}

variable "network_interface_id" {
  description = "ID of the network interface to associate with the virtual machine"
  type        = string
  default     = ""
}

variable "os_disk_caching" {
  description = "Caching type for the OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "Storage account type for the OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "source_image_publisher" {
  description = "Publisher of the source image"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "source_image_offer" {
  description = "Offer of the source image"
  type        = string
  default     = "WindowsServer"
}

variable "source_image_sku" {
  description = "SKU of the source image"
  type        = string
  default     = "2019-Datacenter"
}

variable "source_image_version" {
  description = "Version of the source image"
  type        = string
  default     = "latest"
}

variable "network_interface_name" {
  description = "Name of the network interface"
  type        = string
  default     = "nic-main"
}

variable "public_ip_name" {
  description = "Name of the public IP address"
  type        = string
  default     = "pip-main"
}

variable "public_ip_allocation_method" {
  description = "Allocation method for the public IP address"
  type        = string
  default     = "Dynamic"
}

variable "public_ip_sku" {
  description = "SKU for the public IP address"
  type        = string
  default     = "Standard"
}