resource "azurerm_resource_group" "example" {
  name     = "example-resources23"
  location = "West Europe"
}

resource "azurerm_resource_group" "example123" {
  name     = "example-resources234"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname12331"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "staging"
  }
  
}