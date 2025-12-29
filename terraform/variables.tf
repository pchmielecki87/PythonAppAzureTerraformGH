# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on:
# Modified by:

variable "prefix" {
  type    = string
  default = null
}

variable "rg_name" {
  type    = string
  default = null
}

variable "location" {
  type    = string
  default = null
}

variable "retention_in_days" {
  type    = string
  default = null
}

variable "storage_account_name" {
  description = "The name of the storage account"
  default     = "demo123demo" # value declared directly
}

variable "contianer_storage_account_name" {
  description = "The name of the container in storage account"
  default     = "demo123demo" # value declared directly
}

variable "tags" {
  type    = map(string)
  default = {}
}