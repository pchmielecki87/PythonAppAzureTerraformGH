# Copyright 2025 TechBrain. All rights reserverd.
#
# Created on: 2025.12.01
# Created by: Przemyslaw Chmielecki
# Modified on:
# Modified by:

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be provisioned"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
}

variable "contianer_storage_account_name" {
  type        = string
  description = "The name of the container in storage account"
}