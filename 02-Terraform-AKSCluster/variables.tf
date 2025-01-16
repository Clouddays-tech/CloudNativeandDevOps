variable "common_tags" {
  type = map(string)
  default = {
    environment = "Development"
    owner       = "Platform Team"
    region      = "eastus"
    project     = "AKS Terraform"
  }
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "acr_name" {
  type        = string
  description = "ACR name"
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
  default     = "AKS-VNET-EUS-001"
}

variable "subnets" {
  description = "List of subnets with name and address_prefix"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "create_nsgs" {
  description = "Flag to determine if NSGs should be created and associated with subnets."
  type        = bool
}

variable "nsg_rules" {
  description = "List of NSG rules with name, priority, and port"
  type = list(object({
  name = string, priority = number, port = number }))
}

variable "rbac_aad_admin_group_object_ids" {
  type        = list(string)
  default     = null
  description = "Object ID of groups with admin access."
}

variable "rbac_aad_azure_rbac_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Is Role Based Access Control based on Azure AD enabled?"
}

variable "rbac_aad_tenant_id" {
  type        = string
  default     = null
  description = "(Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used."
}


# variable "vnet_id" {
#   description = "The ID of the Virtual Network where AKS will be deployed"
#   type        = string
# }

# variable "aks_subnet_id" {
#   description = "The ID of the Subnet where AKS will be deployed"
#   type        = string
# }
