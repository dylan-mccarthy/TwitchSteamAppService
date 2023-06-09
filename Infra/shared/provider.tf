terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.50.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate27067"
    container_name       = "tfstate"
    key                  = "terraform-shared.tfstate"
  }
}

provider "azurerm" {
  features {}
}
