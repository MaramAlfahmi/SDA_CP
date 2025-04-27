output "vmss_id" {  
  description = "ID of the Virtual Machine Scale Set"  
  value       = azurerm_virtual_machine_scale_set.example.id  
}  

output "vmss_public_ip" {  
  description = "Public IP addresses of the VM instances"  
  value       = azurerm_public_ip.example.ip_address  
}  

output "admin_username" {  
  description = "Admin username for accessing the VM instances"  
  value       = var.admin_vmss_username  
}  

output "vmss_instance_count" {  
  description = "Number of instances in the VMSS"  
  value       = var.instance_count  
}  

output "resource_group_name" {  
  description = "Resource Group Name"  
  value       = azurerm_resource_group.main.name  
}  
