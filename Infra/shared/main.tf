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

