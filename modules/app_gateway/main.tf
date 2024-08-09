resource "azurerm_application_gateway" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }
  
  gateway_ip_configuration {
    name      = "appgw-ip-config"
    subnet_id = var.subnet_id
  }
  
  frontend_ip_configuration {
    name                 = "appgw-frontend-ip"
    public_ip_address_id = var.public_ip_address_id
  }
  
  frontend_port {
    name = "appgw-frontend-port"
    port = var.frontend_port
  }
  
  http_listener {
    name                           = "appgw-http-listener"
    frontend_ip_configuration_name = "appgw-frontend-ip"
    frontend_port_name             = "appgw-frontend-port"
    protocol                       = var.protocol
  }
  
  backend_address_pool {
    name = "appgw-backend-pool"
  }
  
  backend_http_settings {
    name                  = "appgw-backend-http-settings"
    port                  = var.backend_port
    protocol              = var.backend_protocol
    cookie_based_affinity = var.cookie_based_affinity
  }
  
  request_routing_rule {
    name                       = "appgw-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "appgw-http-listener"
    backend_address_pool_name = "appgw-backend-pool"
    backend_http_settings_name = "appgw-backend-http-settings"
  }
  
  tags = var.tags
}
