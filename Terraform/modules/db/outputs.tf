output "postgresql_server_name" {
  description = "The name of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.dbserver.name
}

output "postgresql_server_fqdn" {
  description = "The fully qualified domain name of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.dbserver.fqdn
}

output "postgresql_database_name" {
  description = "The name of the PostgreSQL database"
  value       = azurerm_postgresql_flexible_server_database.chatbotdb.name
}

output "postgresql_backup_retention_days" {
  description = "The configured backup retention period in days"
  value       = local.postgres_backup_retention
}

output "firewall_rule_name" {
  description = "The name of the configured firewall rule"
  value       = azurerm_postgresql_flexible_server_firewall_rule.dbfirewall.name
}
