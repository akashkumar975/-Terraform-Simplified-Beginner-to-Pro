terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.110.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}
variable "rg_details" {
  type = map
  default = {
    "dev" = "eastus"
    "test" = "westus"
    "prod" = "westeurope"
  }
}
resource "azurerm_resource_group" "example" {
  name     = "myrg"
  location = lookup(var.rg_details,"dr","centralindia")
}