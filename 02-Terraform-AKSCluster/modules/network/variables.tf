
#  Resource Group Name
variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "EastUS"
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
  # default     = "AKS-VNET-EUS-001"
}

variable "address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets to create in the VNet"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}
