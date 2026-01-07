# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on: 2026.01.07
# Modified by: Przemyslaw Chmielecki

variable "rg_name" {
  type    = string
  default = null

  validation {
    condition     = var.rg_name == null || length(var.rg_name) <= 90
    error_message = "rg_name must be 90 characters or fewer."
  }
}

variable "location" {
  type    = string
  default = null

  validation {
    condition = var.location == null || contains([
      "westeurope",
      "northeurope",
      "eastus",
      "westus",
      "uksouth",
      "francecentral"
    ], lower(var.location))

    error_message = "location must be a supported Azure region (e.g. westeurope, eastus)."
  }
}

#TODO add validation
variable "app_service_plan_name" {
  type        = string
  description = "The Azure AppService Plan name"
}

variable "app_service_name" {
  type        = string
  description = "The Azure AppService name"
}

variable "os_type" {
  type        = string
  description = "The OS type name"
}

variable "sku_name" {
  type        = string
  description = "The SKU name"
}

variable "tags" {
  type    = map(string)
  default = {}
}