resource "azurerm_resource_group" "example" {
  name     = "without-dynamic-block-RG"
  location = "southindia"
}

resource "azurerm_network_security_group" "example" {
  name                = "withoutdynamicgroup"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  # First security rule
  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Second security rule
  security_rule {
    name                       = "test456"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "53"  # DNS port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Third security rule
  security_rule {
    name                       = "allowHTTP"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"  # HTTP port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Fourth security rule
  security_rule {
    name                       = "allowHTTPS"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"  # HTTPS port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Fifth security rule
  security_rule {
    name                       = "denyAll"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
