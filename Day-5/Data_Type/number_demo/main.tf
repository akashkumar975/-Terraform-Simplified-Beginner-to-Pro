resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = "West Europe"
}


variable "rg_name" {
  type = number
  default = "123"
}