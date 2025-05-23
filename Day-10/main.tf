terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.114.0"
    }
  }


}

provider "azurerm" {
  features {
  }
  subscription_id = "a40088c8-9fd4-4470-9ebf-310f174f723e"
}
module "linuxvm" {
  source      = "git::https://ak-ado-organization@dev.azure.com/ak-ado-organization/terraform/_git/terraform"
  rg_name     = var.rg_name
  rg_location = var.rg_location
  vm_configs = {
    vm_name              = var.vm_configs.vm_name
    size                 = var.vm_configs.vm_size
    admin_username       = var.vm_configs.admin_username
    admin_password       = var.vm_configs.admin_password
    storage_account_type = var.vm_configs.storage_account_type
    publisher            = var.vm_configs.publisher
    offer                = var.vm_configs.offer
    sku                  = var.vm_configs.sku
    version              = var.vm_configs.version
  }
  vnet_config = {
    vnet_name             = var.vnet_config.vnet_name
    vnet_address_prefixes = var.vnet_config.vnet_address_space
    snet_name             = var.vnet_config.sbnet_name
    snet_address_prefixes = var.vnet_config.sbnet_address_space
  }
}