# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "/subscriptions/a40088c8-9fd4-4470-9ebf-310f174f723e/resourceGroups/tf-import-demo-RG/providers/Microsoft.Storage/storageAccounts/tfimportstrg"
resource "azurerm_storage_account" "example" {
  access_tier                       = "Hot"
  account_kind                      = "StorageV2"
  account_replication_type          = "LRS"
  account_tier                      = "Standard"
  allow_nested_items_to_be_public   = false
  allowed_copy_scope                = null
  cross_tenant_replication_enabled  = false
  default_to_oauth_authentication   = false
  dns_endpoint_type                 = "Standard"
  edge_zone                         = null
  https_traffic_only_enabled        = true
  infrastructure_encryption_enabled = false
  is_hns_enabled                    = false
  large_file_share_enabled          = true
  local_user_enabled                = true
  location                          = "southindia"
  min_tls_version                   = "TLS1_2"
  name                              = "tfimportstrg"
  nfsv3_enabled                     = false
  public_network_access_enabled     = true
  queue_encryption_key_type         = "Service"
  resource_group_name               = "tf-import-demo-RG"
  sftp_enabled                      = false
  shared_access_key_enabled         = true
  table_encryption_key_type         = "Service"
  tags                              = {}
  blob_properties {
    change_feed_enabled           = true
    change_feed_retention_in_days = 7
    default_service_version       = null
    last_access_time_enabled      = false
    versioning_enabled            = false
    container_delete_retention_policy {
      days = 7
    }
    delete_retention_policy {
      days                     = 7
      permanent_delete_enabled = false
    }
  }
  share_properties {
    retention_policy {
      days = 7
    }
  }
}
