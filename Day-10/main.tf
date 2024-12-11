terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.114.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup" # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "tfstorageaccnt423"            # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                      # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"       # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {
  }
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