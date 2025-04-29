output "VM_subnet_id" {
  value = azurerm_subnet.VMSubnet.id
}

output "Vnet_name" {
  value = azurerm_virtual_network.Vnet1.name
}

output "web_app_subnet_id" {  
  value = azurerm_subnet.VMSubnet.id 
}  
