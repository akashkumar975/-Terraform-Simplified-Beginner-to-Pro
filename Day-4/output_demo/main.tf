resource "azurerm_resource_group" "example" {
  name     = "output-demo_RG"
  location = "West Europe"
}

resource "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

output "ip_address" {
    value= azurerm_public_ip.example.ip_address
  
}
output "name_pip" {
    value= azurerm_public_ip.example.name
  
}

output "ip_values" {
    value = {
        ip_address=azurerm_public_ip.example.ip_address
        name_pip=azurerm_public_ip.example.name
    }
  
}