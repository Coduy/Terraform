output "id" {
  description = "The ID of the Container Apps Environment."
  value       = azurerm_container_app_environment.this.id
}

output "name" {
  description = "The name of the Container Apps Environment."
  value       = azurerm_container_app_environment.this.name
}

output "location" {
  description = "The location of the Container Apps Environment."
  value       = azurerm_container_app_environment.this.location
}