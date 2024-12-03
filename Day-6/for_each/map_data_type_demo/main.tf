resource "azurerm_resource_group" "example" {
  for_each = var. rg_details
  name     = each.key
  location = each.value
}

