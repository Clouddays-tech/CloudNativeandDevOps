variable "resource_group_name" {
  type        = string
  description = "Name of resource group from RSG module"
}

variable "location" {
  type    = string
  default = "EastUS"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
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

variable "create_nsgs" {
  description = "Flag to determine if NSGs should be created and associated with subnets."
  type        = bool
  default     = true
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags of the resource."
}

variable "nsg_rules" {
  description = "List of NSG rules with name, priority, and port"
  type = list(object({
    name     = string
    priority = number
    port     = number
  }))
  # default = [
  #   { name = "allow_https", priority = 101, port = 443 },
  #   { name = "allow_http", priority = 102, port = 80 }
  # ]
}
