run "app_service_plan_sku" {
  command = plan

  assert {
    condition     = azurerm_service_plan.this.sku_name == "F1"
    error_message = "App Service Plan must use F1"
  }
}

run "app_service_https_only" {
  command = plan

  assert {
    condition     = azurerm_linux_web_app.this.https_only == true
    error_message = "HTTPS must be enabled"
  }
}