terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-state"
    storage_account_name = "tfstatebackend1024"
    container_name       = "tfstatedev"
    key                  = "terraform.tfstate"
  }
}