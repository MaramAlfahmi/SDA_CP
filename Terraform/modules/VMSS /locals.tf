#================================= VMSS ====================================  
resource "azurerm_linux_virtual_machine_scale_set" "vmss" {  
  name                = var.vmss_name  
  resource_group_name = var.resource_group_name  
  location            = var.location  

  sku {  
    name     = "Standard_B1s"  
    capacity = 2  
  }  

  admin_username = var.adminUserName  

  admin_ssh_key {  
    public_key = file("${path.module}/../../ssh-keys/terraform-azure-vmss.pub")  
  }  

  source_image_id = var.source_image_id  

  network_interface {  
    name    = "network_interface"  
    primary = true  

    ip_configuration {  
      name     = "internal"  
      primary  = true  
      subnet_id = var.subnet_id  
    }  
  }  
}  
