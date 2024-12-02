resource "azurerm_resource_group" "example" {
  for_each = toset(var.rg_details)
  name     = each.value 
  location = "eastus"
}

