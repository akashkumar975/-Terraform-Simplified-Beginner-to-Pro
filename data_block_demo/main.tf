

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

data "azurerm_resource_group" "example" {
  name = "Data_block_demo"
}

