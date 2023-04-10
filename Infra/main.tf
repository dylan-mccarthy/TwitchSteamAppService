resource "azurerm_resource_group" "twitchapp" {
  name     = "twitchapp01"
  location = var.app_location
}

resource "azurerm_container_registry" "twitchapp" {
  name = var.ACR_NAME
  resource_group_name = azurerm_resource_group.twitchapp.name
  location = var.app_location
  admin_enabled = true
  sku = "Basic"

}

resource "azurerm_service_plan" "twitchapp" {
  name                = "twitchapp01-serviceplan"
  resource_group_name = azurerm_resource_group.twitchapp.name
  location            = var.app_location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "twitchapp" {
  name                = "twitchapp01-app"
  resource_group_name = azurerm_resource_group.twitchapp.name
  location            = var.app_location
  service_plan_id     = azurerm_service_plan.twitchapp.id

  site_config {
    container_registry_use_managed_identity = true
    application_stack {
      docker_image = "dmctwitchacr.azurecr.io/twitchappdemo"
      docker_image_tag = "latest"
    }
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL" = "https://dmctwitchacr.azurecr.io"
  }

  identity {
    type = "SystemAssigned"
  }

}


