# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on: 2026.01.07
# Modified by: Przemyslaw Chmielecki

# TF and Provider version - needed for TFLint
terraform {
  required_version = ">= 1.5" # TF version
  required_providers {        # Azure RM provider version
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.57"
    }
  }
}

resource "azurerm_service_plan" "app" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = var.os_type
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.app.id
  tags                = var.tags

  site_config {
    always_on = false
  }
}
