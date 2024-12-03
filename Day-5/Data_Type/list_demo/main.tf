resource "azurerm_resource_group" "example" {
  name     =  var.rg_info[0]
  location = var.rg_info[1]
}

variable "rg_info" {
  type = list  
  default = ["list_rg","eastus"]
  
}


