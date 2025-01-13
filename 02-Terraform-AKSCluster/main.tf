
module "rsg" {
  source = "./modules/rsg"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source = "./modules/network"

  vnet_name           = var.vnet_name
  resource_group_name = module.rsg.aks_rg_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
  subnets             = var.subnets
}


module "aks" {
  source                          = "./modules/aks"
  cluster_name                    = "my-aks-cluster-eus"
  kubernetes_version              = var.kubernetes_version
  location                        = var.location
  resource_group_name             = module.rsg.aks_rg_name
  system_node_count               = var.system_node_count
  vm_size                         = "Standard_B2s"               #"Standard_DS2_v2"
  aks_subnet_id                   = module.network.subnet_ids[1] # Use the second subnet
  acr_name                        = var.acr_name
  rbac_aad_admin_group_object_ids = var.rbac_aad_admin_group_object_ids
  rbac_aad_azure_rbac_enabled     = var.rbac_aad_azure_rbac_enabled
  rbac_aad_tenant_id              = var.rbac_aad_tenant_id
  agw_subnet_id                   = module.network.subnet_ids[2]
  vnet_name                       = var.vnet_name

  tags = {
    environment = "Production"
    owner       = "Platform Team"
    region      = "eastus"
  }
  agents_tags = {
    environment = "Production"
    role        = "Node Pool"
  }
}