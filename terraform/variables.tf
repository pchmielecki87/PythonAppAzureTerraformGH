# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on:
# Modified by:

variable "subscription_id" {
  type    = string
  default = null
}

variable "prefix" {
  type    = string
  default = null

  validation {
    condition     = var.prefix == null || can(regex("^[a-z0-9-]{5,15}$", var.prefix))
    error_message = "prefix must be 5–15 characters, lowercase letters, numbers or hyphens."
  }
}

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

variable "retention_in_days" {
  type    = number
  default = null

  validation {
    condition     = var.retention_in_days == null || (var.retention_in_days >= 7 && var.retention_in_days <= 365)
    error_message = "retention_in_days must be between 7 and 365."
  }
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "demo123demo" # value declared directly
}

variable "contianer_storage_account_name" {
  description = "The name of the container in storage account"
  type        = string
  default     = "demo123demo" # value declared directly
}

variable "tags" {
  type    = map(string)
  default = {}
}