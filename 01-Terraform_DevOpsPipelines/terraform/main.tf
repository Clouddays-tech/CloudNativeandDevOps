resource "azurerm_resource_group" "rg" {
  name     = "example-rg"
  location = var.default_location
}

# Created feature-branch
