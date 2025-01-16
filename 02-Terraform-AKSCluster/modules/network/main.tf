#tflint-ignore: terraform_required_providers, terraform_required_version
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

# Network Security Groups (NSG)
resource "azurerm_network_security_group" "nsg" {
  count = var.create_nsgs ? length(var.subnets) : 0

  name                = "${var.subnets[count.index].name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  # Dynamic block for NSG security rules
  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = tostring(security_rule.value.port)
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

resource "azurerm_subnet" "subnet" {
  count = length(var.subnets)

  name                 = var.subnets[count.index].name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnets[count.index].address_prefix]
}

# Subnet NSG Associations
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  count = var.create_nsgs ? length(var.subnets) : 0

  subnet_id                 = azurerm_subnet.subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg[count.index].id
}


# # resource "azurerm_subnet" "subnet" {
# #   count = length(var.subnets)

# #   name                 = var.subnets[count.index].name
# #   resource_group_name  = var.resource_group_name
# #   virtual_network_name = azurerm_virtual_network.vnet.name
# #   address_prefixes     = [var.subnets[count.index].address_prefix]
# # }

# # Subnet Resource
# resource "azurerm_subnet" "subnet" {
#   count = length(var.subnets)

#   name                 = var.subnets[count.index].name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = [var.subnets[count.index].address_prefix]
# }

# # Subnet NSG Association
# resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
#   count = var.create_nsgs ? length(var.subnets) : 0

#   subnet_id                 = azurerm_subnet.subnet[count.index].id
#   network_security_group_id = azurerm_network_security_group.nsg[count.index].id
# }

