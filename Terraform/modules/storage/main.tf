resource "random_id" "random_id" {
  keepers = {
    resource_group = var.resource_group_name
  }
  byte_length = 4
}

resource "azurerm_storage_account" "stgaccount" {
  name                     = "store${random_id.random_id.hex}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "blob" {
  name                  = var.container
  storage_account_id    = azurerm_storage_account.stgaccount.id
  container_access_type = "private"
}
