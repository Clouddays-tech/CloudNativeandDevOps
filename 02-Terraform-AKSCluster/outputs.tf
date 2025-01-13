output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_ids" {
  value = module.network.subnet_ids
}


output "aks_id" {
  value = module.aks.aks_id
}

output "aks_fqdn" {
  value = module.aks.aks_fqdn
}

output "aks_node_rg" {
  value = module.aks.aks_node_rg
}

output "acr_id" {
  value = module.aks.acr_id
}

output "acr_login_server" {
  value = module.aks.acr_login_server
}


