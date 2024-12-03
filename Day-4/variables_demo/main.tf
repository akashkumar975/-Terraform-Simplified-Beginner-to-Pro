resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_public_ip" "example" {
  name                = var.pip_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}


