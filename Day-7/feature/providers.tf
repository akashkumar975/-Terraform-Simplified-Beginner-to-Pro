terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.13.0"
    }
  }
}

provider "azurerm" {
features {
    key_vault {
      purge_soft_delete_on_destroy    = false
    
    }

  }
subscription_id = "a40088c8-9fd4-4470-9ebf-310f174f723e"
}