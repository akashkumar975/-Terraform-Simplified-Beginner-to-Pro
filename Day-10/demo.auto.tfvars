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
  vnet_address_space = ["10.0.0.0/16"]
  sbnet_name             = "Infra_snet"
  sbnet_address_space = ["10.0.2.0/24"]
}