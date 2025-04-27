locals {
  storage_account_name = lower("store${random_id.random_id.hex}")
  container_name      = var.container
}
