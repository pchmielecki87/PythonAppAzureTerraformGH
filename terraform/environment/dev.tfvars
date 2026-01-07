# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on:
# Modified by:

subscription_id   = "63abcf25-b8df-4c76-8b31-5004c9ba37cd" #PAYG
prefix            = "ghashopdemo"
rg_name           = "ghashopdemo-rg"
location          = "westeurope"
retention_in_days = 30

tags = {
  project     = "shopping-list-demo"
  environment = "dev"
  cicd        = "gha"
}