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

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}