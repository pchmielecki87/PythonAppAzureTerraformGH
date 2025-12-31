run "app_service_plan_sku" {
  command = plan

  variables {
    subscription_id = "63abcf25-b8df-4c76-8b31-5004c9ba37cd" #PAYG
  }

  assert {
    condition     = azurerm_service_plan.asp.sku_name == "F1"
    error_message = "App Service Plan must use F1"
  }
}

run "app_service_https_only" {
  command = plan

  variables {
    subscription_id = "63abcf25-b8df-4c76-8b31-5004c9ba37cd" #PAYG
  }

  assert {
    condition     = azurerm_linux_web_app.app.https_only == true
    error_message = "HTTPS must be enabled"
  }
}