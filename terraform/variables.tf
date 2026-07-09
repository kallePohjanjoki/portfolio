# terraform/variables.tf

variable "resource_group_name" {
  type    = string
  default = "rg-pohjanjoki-prod"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "environment" {
  type    = string
  default = "prod"
}
