provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "file_storage" {
  name                     = "mystorageaccount"
  resource_group_name      = "myResourceGroup"
  location                 = "East US"
  account_tier             = "Premium"
  account_replication_type = "LRS"
  kind                     = "FileStorage"
  minimum_tls_version      = "TLS1_2"
}

resource "azurerm_storage_share" "file_share" {
  name                 = "myshare"
  storage_account_name = azurerm_storage_account.file_storage.name
  quota                = 1024
}
