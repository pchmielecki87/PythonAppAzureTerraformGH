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

# resource "azurerm_service_plan" "app" {
#   name                = "${var.prefix}-${var.app_service_plan_name}"
#   location            = var.location
#   resource_group_name = var.rg_name
#   os_type             = var.os_type
#   sku_name            = var.sku_name
#   tags                = var.tags
# }

resource "azurerm_linux_web_app" "app" {
  name                = "${var.prefix}-${var.app_service_name}"
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.app.id
  tags                = var.tags

  site_config {
    always_on = false
    application_stack {
      python_version = "3.11"
    }
  }

  app_settings = {
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.ai.connection_string
    "WEBSITE_RUN_FROM_PACKAGE"              = "1"
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.ai.instrumentation_key
    # "APPLICATIONINSIGHTS_CONNECTION_STRING" = "InstrumentationKey=${azurerm_application_insights.ai.instrumentation_key}"
    "PYTHON_VERSION"                 = "3.11"
    "KEYVAULT_URI"                   = data.azurerm_key_vault.kv.vault_uri
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = true
  }

}