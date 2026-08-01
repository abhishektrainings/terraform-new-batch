terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "rg-tf-state"
    storage_account_name = "tfstatebackend1024"
    container_name       = "tfstateprod"
    key                  = "prod/terraform.tfstate"
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

  environment           = "prod"
  project_name          = "batch"
  location              = "centralus"
  resource_group_name   = "rg-batch-prod"
  vnet_name             = "vnet-batch-prod"
  subnet_name           = "snet-batch-prod"
  vm_name               = "vm-batch-prod"
  vm_size               = "Standard_B2s"
  admin_username        = "azureuser"
  admin_password        = "ChangeMe123!"
  address_space         = ["10.3.0.0/16"]
  subnet_address_prefix = ["10.3.0.0/24"]

  tags = {
    Environment = "prod"
    ManagedBy   = "Terraform"
    Owner       = "abhishektraining30@gmail.com"
    Impact      = "high"
  }
}
