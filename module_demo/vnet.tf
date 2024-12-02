resource "azurerm_virtual_network" "example" {
  name                = var.vnet_config.vnet_name
  address_space       = var.vnet_config.vnet_address_space
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = var.vnet_config.sbnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.vnet_config.sbnet_address_space
}