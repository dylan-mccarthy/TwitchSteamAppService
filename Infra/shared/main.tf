resource "azurerm_resource_group" "shared" {
  name     = var.shared_resource_group
  location = var.app_location
}

resource "azurerm_container_registry" "shared" {
  name                = var.ACR_NAME
  resource_group_name = azurerm_resource_group.shared.name
  location            = var.app_location
  admin_enabled       = true
  sku                 = "Basic"

}

resource "azurerm_sql_server" "shared" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.shared.name
  location                     = var.app_location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_sql_database" "shared" {
  name                = var.sql_database_name
  resource_group_name = azurerm_resource_group.shared.name
  location            = var.app_location
  server_name         = azurerm_sql_server.shared.name
  edition             = "Standard"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb         = 1
}

resource "azurerm_log_analytics_workspace" "shared" {
  name                = var.log_analytics_workspace_name
  location            = var.app_location
  resource_group_name = azurerm_resource_group.shared.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "shared" {
  name                = var.app_insights_name
  location            = var.app_location
  resource_group_name = azurerm_resource_group.shared.name
  workspace_id        = azurerm_log_analytics_workspace.shared.id  
  application_type    = "web"
}