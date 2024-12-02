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
}

module "demo_vm" {
  source   = "../.."
  rg_name  = "demo_vm_RG"
  location = "eastus"
  vnet_config = {
    vnet_name           = "vm_vnet"
    vnet_address_space  = ["10.0.0.0/16"]
    sbnet_name          = "vm_snet"
    sbnet_address_space = ["10.0.2.0/24"]
  }
  vm_configs = {
    vm_name              = "demo-vm"
    vm_size              = "Standard_F2"
    admin_username       = "adminuser"
    admin_password       = "Pa$$w0rd1234"
    storage_account_type = "Standard_LRS"
    publisher            = "MicrosoftWindowsServer"
    offer                = "WindowsServer"
    sku                  = "2016-Datacenter"
    version              = "latest"

  }

}