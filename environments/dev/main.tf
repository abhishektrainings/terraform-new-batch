# dev environment configuration for Terraform
terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "rg-tf-state"
    storage_account_name = "tfstatebackend1024"
    container_name       = "tfstate"
    key                  = "dev/terraform.tfstate"
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

  environment           = "dev"
  project_name          = "batch"
  location              = "eastus"
  resource_group_name   = "rg-batch-dev"
  vnet_name             = "vnet-batch-dev"
  subnet_name           = "snet-batch-dev"
  vm_name               = "vm-batch-dev"
  vm_size               = "Standard_B1s"
  admin_username        = "azureuser"
  admin_password        = "ChangeMe123!"
  address_space         = ["10.1.0.0/16"]
  subnet_address_prefix = ["10.1.0.0/24"]

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Owner       = "abhishektraining30@gmail.com"
    Impact      = "low"
  }
}
