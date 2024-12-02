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
variable "rg_name" {
  type = list
  default = ["test","dev"]
  }
  variable "rg_location" {
  type = list
  default = ["eastus","westus"]
  }

resource "azurerm_resource_group" "example" {
  name     = element(var.rg_name,1)
  location = element(var.rg_location,1)
}