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

variable "app_service_plan_name" {
  type        = string
  description = "The Azure App Service Plan name"

  validation {
    condition     = length(var.app_service_plan_name) >= 1 && length(var.app_service_plan_name) <= 40
    error_message = "App Service Plan name must be between 1 and 40 characters."
  }
}

variable "app_service_name" {
  type        = string
  description = "The Azure App Service name"

  validation {
    condition = (
      length(var.app_service_name) >= 2 &&
      length(var.app_service_name) <= 60 &&
      can(regex("^[a-zA-Z0-9-]+$", var.app_service_name))
    )
    error_message = "App Service name must be 2–60 characters and contain only letters, numbers, and hyphens."
  }
}

variable "os_type" {
  type        = string
  description = "The OS type name"

  validation {
    condition     = contains(["Linux", "Windows"], var.os_type)
    error_message = "os_type must be either 'Linux' or 'Windows'."
  }
}

variable "sku_name" {
  type        = string
  description = "The SKU name"

  validation {
    condition = contains([
      "F1",
      "B1", "B2", "B3",
      "S1", "S2", "S3",
      "P1v3", "P2v3", "P3v3"
    ], var.sku_name)

    error_message = "Invalid sku_name. Allowed values: F1, B1–B3, S1–S3, P1v3–P3v3."
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}