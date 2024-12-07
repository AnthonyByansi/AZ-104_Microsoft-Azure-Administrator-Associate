provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "file_storage" {
  name                     = "mystorageaccount"
  resource_group_name      = "myResourceGroup"
  location                 = "East US"
  account_tier             = "Premium"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "file_share" {
  name                 = "myshare"
  storage_account_id = azurerm_storage_account.file_storage.id
  quota                = 1024
}
