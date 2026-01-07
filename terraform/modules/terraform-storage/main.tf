# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on: 2026.01.02
# Modified by: Przemyslaw Chmielecki

# TF and Provider version - needed for TFLint
terraform {
  required_version = ">= 1.5" # TF version
  required_providers {        # Azure RM provider version
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.57"
    }
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_storage_container" "sa" {
  name                  = var.contianer_storage_account_name
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}
