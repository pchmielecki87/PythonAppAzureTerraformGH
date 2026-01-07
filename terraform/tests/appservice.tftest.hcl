# Single declaration in locals
locals {
    subscription_id = "63abcf25-b8df-4c76-8b31-5004c9ba37cd" #PAYG
    rg_name         = "ghashopdemo-rg"
    location        = "westeurope"
    prefix          = "ghashopdemo"
}

#1 Tastcase
run "app_service_plan_sku" {
  command = plan

  # just called out from main locals
  variables {
    subscription_id = local.subscription_id
    rg_name         = local.rg_name
    location        = local.location
    prefix          = local.prefix
  }

  assert {
    condition     = azurerm_service_plan.asp.sku_name == "F1"
    error_message = "App Service Plan must use F1"
  }
}

#2 Tastcase
run "app_service_https_only" {
  command = plan
  
  # just called out from main locals
  variables {
    subscription_id = local.subscription_id
    rg_name         = local.rg_name
    location        = local.location
    prefix          = local.prefix
  }

  assert {
    condition     = azurerm_linux_web_app.app.https_only == true
    error_message = "HTTPS must be enabled"
  }
}