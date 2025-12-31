run "app_service_plan_sku" {
  command = plan

  # Needed to be injected for tests needs (cannot get from variables.tf)
  variables {
    subscription_id = "63abcf25-b8df-4c76-8b31-5004c9ba37cd" #PAYG
  }
  # pass tfvars
  terraform {
    extra_arguments {
      commands = ["plan", "apply"]
      arguments = ["-var-file=../environment/dev.tfvars"]
    }
  }
  
  assert {
    condition     = azurerm_service_plan.asp.sku_name == "F1"
    error_message = "App Service Plan must use F1"
  }
}

run "app_service_https_only" {
  command = plan

  # Needed to be injected for tests needs (cannot get from variables.tf)
  variables {
    subscription_id = "63abcf25-b8df-4c76-8b31-5004c9ba37cd" #PAYG
  }
  # pass tfvars
  terraform {
    extra_arguments {
      commands = ["plan", "apply"]
      arguments = ["-var-file=../environment/dev.tfvars"]
    }
  }

  assert {
    condition     = azurerm_linux_web_app.app.https_only == true
    error_message = "HTTPS must be enabled"
  }
}