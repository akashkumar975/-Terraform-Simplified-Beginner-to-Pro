resource "azurerm_resource_group" "example" {
  name     = "prevent-destroy-demo-RG"
  location = "West Europe"
}
data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "example" {
  name                        = "kv-demo345"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
  lifecycle {
    prevent_destroy = false
  }
 

}