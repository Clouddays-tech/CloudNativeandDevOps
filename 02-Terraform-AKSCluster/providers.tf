provider "azurerm" {
  subscription_id = local.subscription_id
  # subscription_id = "xxxxxxxxxxxxxxxxxxxxx"
  features {}
}

terraform {
  required_version = ">= 0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

# locals {
#   default_tags = {
#     environment = "Production"
#     owner       = "Platform Team"
#     region      = "eastus"
#     project     = "AKS Terraform"
#   }
# }