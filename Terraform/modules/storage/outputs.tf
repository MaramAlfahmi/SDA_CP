output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.stgaccount.name
}

output "storage_account_id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.stgaccount.id
}

output "storage_account_primary_endpoint" {
  description = "The primary endpoint for the storage account"
  value       = azurerm_storage_account.stgaccount.primary_blob_endpoint
}

output "container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.blob.name
}

output "container_id" {
  description = "The ID of the storage container"
  value       = azurerm_storage_container.blob.id
}
