output "id" {
  description = "The ID of the Container App"
  value       = azurerm_container_app.this.id
}

output "fqdn" {
  description = "The FQDN of the Container App"
  value       = azurerm_container_app.this.default_domain_name
}
