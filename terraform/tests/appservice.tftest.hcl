# Needed to be injected for tests needs (cannot get from variables.tf or dev.tfvars)
locals {
  common_vars = {
    subscription_id = "63abcf25-b8df-4c76-8b31-5004c9ba37cd" #PAYG
    rg_name         = "ghashopdemo-rg"
    location        = "westeurope"
  }
}

run "app_service_plan_sku" {
  command = plan
  variables = local.common_vars

  assert {
    condition     = azurerm_service_plan.asp.sku_name == "F1"
    error_message = "App Service Plan must use F1"
  }
}

run "app_service_https_only" {
  command = plan
  variables = local.common_vars

  assert {
    condition     = azurerm_linux_web_app.app.https_only == true
    error_message = "HTTPS must be enabled"
  }
}