output "application_gateway_id" {
  description = "The ID of the Application Gateway."
  value       = azurerm_application_gateway.example.id
}

output "application_gateway_frontend_ip" {
  description = "The frontend IP of the Application Gateway."
  value       = azurerm_application_gateway.example.frontend_ip_configuration[0].private_ip_address
}
