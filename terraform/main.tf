# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on: 2026.01.02
# Modified by: Przemyslaw Chmielecki

#############################################################################
## SINGLE MAIN.TF WITH ALL RESOURCES, SOME MODULES
#############################################################################

## RG #######################################################################
module "rg" {
  source   = "./modules/terraform-rg"
  rg_name  = var.rg_name
  location = var.location
  tags     = var.tags
}

## WEBAPP ##################################################################
resource "azurerm_service_plan" "asp" {
  name                = "${var.prefix}-asp"
  location            = var.location
  resource_group_name = var.rg_name # normally I could add indirect reference module.rg.name instead of var.rg_name but it WILL NOT use tfvars then
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.prefix}-app"
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.asp.id
  https_only          = true

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

  tags = var.tags

  depends_on = [azurerm_service_plan.asp, azurerm_application_insights.ai]
}

## LAW ####################################################################
resource "azurerm_log_analytics_workspace" "law" {
  name                = "${var.prefix}-law"
  location            = var.location
  resource_group_name = var.rg_name # direct reference to var.rg_name

  sku               = "PerGB2018" #Free <-- not free anymore
  retention_in_days = var.retention_in_days
}

## AI #####################################################################
resource "azurerm_application_insights" "ai" {
  name                = "${var.prefix}-ai"
  location            = var.location
  resource_group_name = var.rg_name

  application_type = "web"
  workspace_id     = azurerm_log_analytics_workspace.law.id

  daily_data_cap_in_gb                  = 0.1
  daily_data_cap_notifications_disabled = true

  depends_on = [azurerm_log_analytics_workspace.law]
}

## SA #####################################################################
module "sa" {
  source                         = "./modules/terraform-storage"
  rg_name                        = var.rg_name
  storage_account_name           = var.storage_account_name
  contianer_storage_account_name = var.contianer_storage_account_name
  location                       = var.location
}

## SANDBOX ###############################################################
resource "azurerm_resource_group" "rg" {
  name     = var.dummy_rg == null ? "dummy_rg_pusta" : "dummy_rg_niepusta"
  location = var.location
  tags     = var.tags
}