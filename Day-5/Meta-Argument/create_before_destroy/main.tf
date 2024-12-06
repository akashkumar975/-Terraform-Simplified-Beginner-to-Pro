resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
  lifecycle {
    create_before_destroy = true
  }

}