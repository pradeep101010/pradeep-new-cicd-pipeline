terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = var.tags
}

# App Service Plan
resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = var.app_service_plan_tier    # e.g. "Basic" / "Standard"
    size = var.app_service_plan_size    # e.g. "B1" / "S1"
  }

  tags = var.tags
}

# App Service (Linux, using built-in runtime)
resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = var.linux_fx_version # e.g. "PYTHON|3.10" or "DOTNETCORE|7.0"
  }

  tags = var.tags
}
