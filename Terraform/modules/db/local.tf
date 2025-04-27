locals {
  database_server_firewall_name = "${var.database_server_name}Firewall"
  postgres_backup_retention     = var.postgres_backup_retention
}
