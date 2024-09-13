output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.storage.name
}

output "fileshare_url" {
  description = "The URL of the created file share."
  value       = azurerm_storage_account.storage.primary_file_endpoint
}
