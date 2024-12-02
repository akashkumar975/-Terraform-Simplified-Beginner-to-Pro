  
    provider "azurerm" {
  features {}
}
 
resource "azurerm_resource_group" "example" {
  name     ="devoprg"
  location = "eastus"
}
 
resource "azurerm_public_ip" "example" {
  name                = "myip${count.index}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
  count = 3
}

variable "env_name" {

    type = list 
    default = ["abc","def","fds"]
  
}