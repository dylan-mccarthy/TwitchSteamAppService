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

resource "azurerm_service_plan" "twitchapp" {
  name                = var.app_service_plan
  resource_group_name = azurerm_resource_group.twitchapp.name
  location            = var.app_location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "twitchapp" {
  name                = var.app_service_linux_web_app
  resource_group_name = azurerm_resource_group.twitchapp.name
  location            = var.app_location
  service_plan_id     = azurerm_service_plan.twitchapp.id

  site_config {
    container_registry_use_managed_identity = true
    application_stack {
      docker_image     = var.docker_image_name
      docker_image_tag = var.docker_image_tag
    }
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL" = "https://dmctwitchacr.azurecr.io"
    "ASPNETCORE_ENVIRONMENT"     = var.aspnetcore_environment
  }

  identity {
    type = "SystemAssigned"
  }

}


