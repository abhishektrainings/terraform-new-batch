terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

module "vnet" {
  source = "./modules/vnet"

  resource_group_name   = azurerm_resource_group.main.name
  location              = var.location
  vnet_name             = var.vnet_name
  address_space         = var.address_space
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix
}

module "virtualmachine" {
  source = "./modules/virtualmachine"

  resource_group_name  = azurerm_resource_group.main.name
  location             = var.location
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  network_interface_id = module.vnet.subnet_id
  subnet_id            = module.vnet.subnet_id
  tags                 = var.tags
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  storage_account_name = var.storage_account_name
  tags                = var.tags
}