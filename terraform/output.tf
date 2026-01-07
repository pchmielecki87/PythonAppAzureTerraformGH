# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2026.01.02
# Created by: Przemyslaw Chmielecki
# Modified on: 2026.01.03
# Modified by: Przemyslaw Chmielecki

output "rg_name" {
  value       = module.rg.azurerm_resource_group.name
  description = "ResourceGroup name"
}

output "appservice_plan_name" {
  value       = module.asp.azurerm_service_plan.name
  description = "AppService Plan name"
}

output "appservice_name" {
  value       = azurerm_linux_web_app.app.name
  description = "AppService name"
}

output "app_service_url" {
  value       = azurerm_linux_web_app.app.default_hostname
  description = "AppService hostname"
}

output "law_name" {
  value       = azurerm_log_analytics_workspace.law.name
  description = "LogAnalitics Workspace name"
}

output "appinsights_name" {
  value       = azurerm_application_insights.ai.name
  description = "Application Insights name"
}