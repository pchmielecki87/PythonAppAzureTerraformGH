# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on:
# Modified by:

data "azurerm_key_vault" "kv" {
  name                = "sages-ado-kv"
  resource_group_name = "sages-ado-kv"
}
