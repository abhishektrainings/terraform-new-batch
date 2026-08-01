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

locals {
  resource_group_name  = var.resource_group_name != null ? var.resource_group_name : "rg-${var.project_name}-${var.environment}"
  vnet_name            = var.vnet_name != null ? var.vnet_name : "vnet-${var.project_name}-${var.environment}"
  subnet_name          = var.subnet_name != null ? var.subnet_name : "snet-${var.project_name}-${var.environment}"
  vm_name              = var.vm_name != null ? var.vm_name : "${var.project_name}-${var.environment}-vm"
  storage_account_name = var.storage_account_name != null ? var.storage_account_name : "st${var.project_name}${var.environment}"
  effective_tags = merge(var.tags, {
    Environment = var.environment
    Project     = var.project_name
  })
}

resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.effective_tags
}

module "vnet" {
  source = "./modules/vnet"

  resource_group_name   = azurerm_resource_group.main.name
  location              = var.location
  vnet_name             = local.vnet_name
  address_space         = var.address_space
  subnet_name           = local.subnet_name
  subnet_address_prefix = var.subnet_address_prefix
}

module "virtualmachine" {
  source = "./modules/virtualmachine"

  resource_group_name    = azurerm_resource_group.main.name
  location               = var.location
  vm_name                = local.vm_name
  vm_size                = var.vm_size
  admin_username         = var.admin_username
  admin_password         = var.admin_password
  network_interface_id   = module.vnet.subnet_id
  subnet_id              = module.vnet.subnet_id
  network_interface_name = "${local.vm_name}-nic"
  tags                   = local.effective_tags
}

module "storage" {
  source = "./modules/storage"

  resource_group_name  = azurerm_resource_group.main.name
  location             = var.location
  storage_account_name = local.storage_account_name
  tags                 = local.effective_tags
}