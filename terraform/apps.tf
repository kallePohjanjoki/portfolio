# Resource definition for the portfolio static web application
resource "azurerm_static_web_app" "portfolio" {
  name                = "stapp-portfolio-prod"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westeurope"
  sku_tier            = "Free"
  sku_size            = "Free"
}

# Output the automatically generated default hostname for the static web app
output "portfolio_default_hostname" {
  value       = azurerm_static_web_app.portfolio.default_host_name
  description = "temp hostname"
}

# Output the deployment token required for the GitHub Actions workflow
output "portfolio_deployment_token" {
  value       = azurerm_static_web_app.portfolio.api_key
  description = "Deployment token"
  sensitive   = true
}
