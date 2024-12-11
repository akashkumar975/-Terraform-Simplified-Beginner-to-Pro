resource "azurerm_resource_group" "example" {
  name     = "tf-import-demo-RG"
  location = "southindia"
}

resource "azurerm_storage_account" "example" {
  name                     = "tfimportstrg"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

 
}

