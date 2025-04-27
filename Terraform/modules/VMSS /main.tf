provider "azurerm" {  
  features {}  
}  

# ========================= Resource Group ========================================  
resource "azurerm_resource_group" "main" {  
  name     = var.resource_group_name  # Using the variable for the resource group name  
  location = var.location              # Use the variable for Azure location  
}  

# ========================= Virtual Network ========================================  
resource "azurerm_virtual_network" "main" {  
  name                = var.Vnet_Name  # Use the variable for the VNet name  
  address_space       = ["10.0.0.0/16"] # Specify the address space for the VNet  
  location            = azurerm_resource_group.main.location  # Use location from resource group  
  resource_group_name = azurerm_resource_group.main.name      # Resource group reference  
}  

# ========================= Subnet ========================================  
resource "azurerm_subnet" "vm_subnet" {  
  name                 = var.VM_subnet                                # Use the variable for the subnet name  
  resource_group_name  = azurerm_resource_group.main.name            # Link to the resource group  
  virtual_network_name = azurerm_virtual_network.main.name           # Link to the virtual network  
  address_prefixes     = ["10.0.1.0/24"]                             # Specify the subnet address prefix  
}  

# ========================= Virtual Machine Scale Set (VMSS) ==========================================  
resource "azurerm_virtual_machine_scale_set" "example" {  
  name                = var.vmss_name                             # Use the variable to set the name  
  location            = var.location                               # Azure region location  
  resource_group_name = azurerm_resource_group.main.name         # Resource group for the VMSS  

  upgrade_policy {  
    mode = "Automatic"  # Set the upgrade policy to automatic  
  }  

  sku {  
    name     = var.vm_size         # Use the variable for VM size  
    tier     = "Standard"          # Tier for the VM size  
    capacity = var.instance_count   # Use the variable for the number of instances  
  }  

  admin_username = var.admin_vmss_username  # Use the variable for admin username  
  admin_password = var.admin_vmss_password  # Use the variable for admin password  

  os_profile {  
    computer_name_prefix = "milestone2-instance"  # Prefix for instance names  
    admin_username       = var.admin_vmss_username  
    admin_password       = var.admin_vmss_password  
  }  

  os_profile_linux_config {  
    disable_password_authentication = false  # Enable password authentication  
  }  

  network_profile {  
    name    = "example-network-profile"  # Network profile name  
    primary = true                       # Set as primary network profile  

    ip_configuration {  
      name      = "example-ip-config"    # Name for the IP configuration  
      subnet_id = azurerm_subnet.vm_subnet.id  # Reference to the subnet resource  
    }  
  }  

  storage_profile_image_reference {  
    publisher = "Canonical"               # Image publisher  
    offer     = "UbuntuServer"            # Image offer  
    sku       = "20.04-LTS"               # Update SKU for current versions available  
    version   = "latest"                  # Image version  
  }  

  storage_profile_os_disk {  
    name           = "osdisk"             # Name for the OS disk  
    caching        = "ReadWrite"           # Disk caching settings  
    create_option  = "FromImage"           # Create option from image  
  }  
}  
