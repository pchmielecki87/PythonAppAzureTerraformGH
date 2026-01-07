# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on: 2026.01.07
# Modified by: Przemyslaw Chmielecki

subscription_id   = "63abcf25-b8df-4c76-8b31-5004c9ba37cd" #PAYG
prefix            = "ghashopdemo"
rg_name           = "ghashopdemo-rg"
location          = "westeurope"
retention_in_days = 30
# app_service_plan_name "${var.prefix}-asp" <--- in variables in ASP module
# app_service_name = "${var.prefix}-app"    <--- in variables in ASP module
os_type  = "Linux"
sku_name = "F1"

tags = {
  project     = "shopping-list-demo"
  environment = "dev"
  cicd        = "gha"
}