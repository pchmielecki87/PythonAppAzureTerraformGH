variable "prefix" {
  type    = string
  default = "shopdemo-gha"
}

variable "rg_name" {
  type    = string
  default = "shopdemo-gha-rg"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "tags" {
  type = map(string)
  default = {
    project     = "shopping-list-demo-gha"
    environment = "dev"
  }
}
