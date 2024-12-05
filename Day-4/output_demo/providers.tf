terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.12.0"
    }
  }
}

provider "azurerm" {
 features {
   
 }
 subscription_id = "a40088c8-9fd4-4470-9ebf-310f174f723e"
}