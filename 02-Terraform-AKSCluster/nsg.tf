resource "azurerm_network_security_rule" "allow_agw_ports" {
  name                        = "allow_agw_ports"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["65200-65535"]
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  network_security_group_name = module.network.nsg_names[2]
  resource_group_name         = var.resource_group_name
}
# Add a new rule to subnet1 NSG
resource "azurerm_network_security_rule" "rdp_rule" {
  name                        = "allow_rdp_subnet1"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = module.network.nsg_names[0]
  resource_group_name         = var.resource_group_name
  # depends_on                  = [module.network]
}
