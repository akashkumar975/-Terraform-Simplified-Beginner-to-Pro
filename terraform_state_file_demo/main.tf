terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.114.0"
    }
  }

   backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "tfstorageaccnt423"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {
}
}
module "linuxvm" {
    source ="git::https://ak-ado-organization@dev.azure.com/ak-ado-organization/terraform/_git/terraform"
      rg_name     = "demo-RG"
  rg_location = "eastus"
  vm_configs = {
    vm_name              = "example-machine"
    size                 = "Standard_F2"
    admin_username       = "adminuser"
    admin_password       = "Pa$$w0rd1234"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "UbuntuServer"
    sku                  = "16.04-LTS"
    version              = "latest"
  }
   vnet_config = {
    vnet_name             = "Infra_vnet"
    vnet_address_prefixes = ["10.0.0.0/16"]
    snet_name             = "Infra_snet"
    snet_address_prefixes = ["10.0.2.0/24"]
  }
}