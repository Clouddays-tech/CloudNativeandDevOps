resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version != null ? var.kubernetes_version : "1.30.6" # Use a default if null
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name
  oidc_issuer_enabled = true
  # private_cluster_enabled           = true
  role_based_access_control_enabled = true
  sku_tier                          = "Free"
  tags                              = var.tags
  workload_identity_enabled         = true
  automatic_upgrade_channel         = "patch"
  node_os_upgrade_channel           = "NodeImage"


  default_node_pool {
    name           = "systempool"
    node_count     = var.system_node_count
    vm_size        = var.vm_size
    vnet_subnet_id = var.aks_subnet_id
    tags           = merge(var.tags, var.agents_tags)
  }

  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.rbac_aad_admin_group_object_ids
    azure_rbac_enabled     = var.rbac_aad_azure_rbac_enabled
    tenant_id              = var.rbac_aad_tenant_id
  }

  identity {
    type = "SystemAssigned"
  }
  # identity {
  #   type         = "UserAssigned"
  #   identity_ids = [azurerm_user_assigned_identity.agic_identity.id]
  # }

  network_profile {
    load_balancer_sku = null    #standard""
    network_plugin    = "azure" # CNI
    # network_plugin_mode = "overlay"
    service_cidr   = "10.0.254.0/23"
    dns_service_ip = "10.0.254.10"
    # outbound_type = "userDefinedRouting"
  }

  ingress_application_gateway {
    gateway_name = "myapp-gw-eus-001"
    subnet_id    = var.agw_subnet_id
    # identity_id  = azurerm_user_assigned_identity.agic_identity.id
  }
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
  tags                = var.tags
}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
  depends_on                       = [azurerm_container_registry.acr]
}

# Sleep for 15  seconds
resource "null_resource" "wait_for_aks_creation" {
  provisioner "local-exec" {
    command = "sleep 15"
  }
  depends_on = [azurerm_kubernetes_cluster.aks]
}

# Retrieve User Assigned Managed Identity after sleep
data "azurerm_user_assigned_identity" "agic_identity" {
  name                = "ingressapplicationgateway-${var.cluster_name}" #my-aks-cluster-eus"  #Update as required
  resource_group_name = azurerm_kubernetes_cluster.aks.node_resource_group
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  depends_on          = [var.aks_subnet_id]
}

# Assign Network Contributor role to the UAMI
resource "azurerm_role_assignment" "agic_network_contributor" {
  principal_id         = data.azurerm_user_assigned_identity.agic_identity.principal_id
  role_definition_name = "Network Contributor"
  scope                = data.azurerm_virtual_network.vnet.id
}
