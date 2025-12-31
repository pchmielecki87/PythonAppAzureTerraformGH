# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on:
# Modified by:

variable "prefix" {
  type    = string
  default = null

  validation {
    condition     = var.rg_name != null || var.prefix != null || can(regex("^[a-z0-9-]{2,10}$", var.prefix))
    error_message = "prefix must be 2–10 characters, lowercase letters, numbers or hyphens."
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
  default     = "demo123demo"

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Storage account name must be 3–24 chars, lowercase letters and numbers only."
  }
}

variable "container_storage_account_name" {
  description = "The name of the container in storage account"
  type        = string
  default     = "demo123demo"

  validation {
    condition     = can(regex("^[a-z0-9-]{3,63}$", var.container_storage_account_name))
    error_message = "Container name must be 3–63 chars, lowercase letters, numbers or hyphens."
  }
}

variable "tags" {
  type    = map(string)
  default = {}

  validation {
    condition     = alltrue([for k, v in var.tags : length(k) > 0 && length(v) > 0])
    error_message = "All tag keys and values must be non-empty strings."
  }
}
