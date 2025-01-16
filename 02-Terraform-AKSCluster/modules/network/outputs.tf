# Outputs
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  value = [for s in azurerm_subnet.subnet : s.id]
}

output "nsg_ids" {
  value = [for n in azurerm_network_security_group.nsg : n.id]
}

output "nsg_names" {
  value = [for nsg in azurerm_network_security_group.nsg : nsg.name]
}
