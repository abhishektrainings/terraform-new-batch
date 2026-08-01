# stg environment configuration for Terraform
terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "rg-tf-state"
    storage_account_name = "tfstatebackend1024"
    container_name       = "tfstatestg"
    key                  = "stg/terraform.tfstate"
  }

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

module "platform" {
  source = "../.."

  environment           = "stg"
  project_name          = "batch"
  location              = "eastus2"
  resource_group_name   = "rg-batch-stg"
  vnet_name             = "vnet-batch-stg"
  subnet_name           = "snet-batch-stg"
  vm_name               = "vm-batch-stg"
  vm_size               = "Standard_B2s"
  admin_username        = "azureuser"
  admin_password        = "ChangeMe123!"
  address_space         = ["10.2.0.0/16"]
  subnet_address_prefix = ["10.2.0.0/24"]

  tags = {
    Environment = "stg"
    ManagedBy   = "Terraform"
    Owner       = "abhishektraining30@gmail.com"
    Impact      = "medium"
  }
}
