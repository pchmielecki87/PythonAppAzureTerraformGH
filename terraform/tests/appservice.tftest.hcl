# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on: 2026.01.07
# Modified by: Przemyslaw Chmielecki
  
# WORKS!

# primal declaration
variables {
  subscription_id = "63abcf25-b8df-4c76-8b31-5004c9ba37cd" #PAYG
  rg_name         = "ghashopdemo-rg"
  location        = "westeurope"
  prefix          = "ghashopdemo"
  app_service_plan_name = "asp"
  app_service_name      = "app"
  os_type               = "Linux"
  sku_name              = "F1"
}

#1 Tastcase
run "app_service_plan_sku" {
  command = plan

  assert {
    condition     = azurerm_service_plan.asp.sku_name == "F1"
    error_message = "App Service Plan must use F1"
  }
}

#2 Tastcase
run "app_service_https_only" {
  command = plan

  assert {
    condition     = azurerm_linux_web_app.app.https_only == true
    error_message = "HTTPS must be enabled"
  }
}