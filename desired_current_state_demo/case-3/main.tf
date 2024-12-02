resource "azurerm_resource_group" "example" {
  name     = "case-3"
  location = "West Europe"
   tags     = {
     "created_by" = "akumar" 
      "env"        = "dev" 
        }
}