# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2026.01.02
# Created by: Przemyslaw Chmielecki
# Modified on: 2026.01.03
# Modified by: Przemyslaw Chmielecki

output "app_service_url" {
  value = azurerm_linux_web_app.app.default_hostname
  description = "AppService Hostname"
}