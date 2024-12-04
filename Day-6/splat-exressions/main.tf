resource "azurerm_resource_group" "example" {
  name     ="demo-RG"
  location = "eastus"
}
resource "azurerm_public_ip" "example" {
  name                = var.mypip[count.index]
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
  count = 4
}

variable "mypip"{
  type = list
  default = ["prod-pip","dev-pip","test-pip","qa-pip"]
}

output "pip_address" {
   value =azurerm_public_ip.example[*].ip_address
  
}

