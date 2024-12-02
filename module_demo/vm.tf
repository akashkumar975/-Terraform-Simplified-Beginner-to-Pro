resource "azurerm_network_interface" "example" {
  name                = format("%s-NIC",(var.vm_configs.vm_name))
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = var.vm_configs.vm_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = var.vm_configs.vm_size
  admin_username      = var.vm_configs.admin_username
  admin_password      = var.vm_configs.admin_password
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.vm_configs.storage_account_type
  }

  source_image_reference {
    publisher = var.vm_configs.publisher
    offer     = var.vm_configs.offer
    sku       = var.vm_configs.sku
    version   = var.vm_configs.version
  }
}