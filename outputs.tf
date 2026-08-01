output "resource_group_name" {
  value       = azurerm_resource_group.main.name
  description = "The name of the resource group"
}

output "environment" {
  value       = var.environment
  description = "The target environment"
}

output "storage_account_id" {
  value       = module.storage.storage_account_id
  description = "The storage account ID"
}

output "vm_id" {
  value       = module.virtualmachine.vm_id
  description = "The virtual machine ID"
}