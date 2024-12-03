resource "azurerm_resource_group" "example" {
  name     = "pip-resources"
  location = "West Europe"
}


resource "azurerm_public_ip" "first_pip" {
  count = 4
  name                = var.pip_names[count.index]
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }

}

variable "pip_names" {
  type = list 
  default = ["dev-pip","qa-pip","prod-pip","test-pip"]
  
}