resource "azurerm_resource_group" "example" {
  name     = var.rg_info.rg_name
  location = var.rg_info.location
}

variable "rg_info" {
    type = map
    default = {
        rg_name = "map_rg"
        location = "eastus"
    }

}

