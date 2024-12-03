resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     =var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = var.env=="dev"?"LRS":"GRS"

  tags = {
    environment = "staging"
  }
}

