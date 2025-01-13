resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

#  Resource Group Name
variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "EastUS"
}
