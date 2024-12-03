

resource "azurerm_public_ip" "example" {
  name                = format("%s-PIP",(var.vm_configs.vm_name))
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"


}