resource "azurerm_resource_group" "example" {
  name     = "output_demo"
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
    value = azurerm_public_ip.example.ip_address
  
}

output "id" {
    value = azurerm_public_ip.example.id
  
}

output "public_ip_output" {
    value = {
      ip_address= azurerm_public_ip.example.ip_address
      id=  azurerm_public_ip.example.id
    }
}