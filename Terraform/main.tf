#=========================Resources Group=====================================
resource "azurerm_resource_group" "RG" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    name = "SDAProject"
  }
}

#=========================Modules===========================================#

#========================= Vnet ======================================#
module "Vnet" {
  source                          = "./modules/Vnet"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  Vnet_Name                       = var.Vnet_Name
  VM_subnet                       = var.VM_subnet
  VM                              = var.VM
  depends_on                      = [azurerm_resource_group.RG]
}

#========================= VM ===========================================#
module "vm" {
  source              = "./modules/vm"
  resource_group_name  = var.resource_group_name
  location            = var.location
  VM_subnet_id        = module.Vnet.VM_subnet_id
  VM                  = var.VM
  adminUserName       = var.adminUserName
  depends_on = [azurerm_resource_group.RG,
  module.Vnet]
}

#========================= storage ===========================================#
module "storage" {
  source              = "./modules/storage"
  resource_group_name = var.resource_group_name
  location            = var.location
  container           = var.container
  depends_on          = [azurerm_resource_group.RG]
}
#========================= postSql db===========================================#
module "db" {
  source               = "./modules/db"
  resource_group_name  = var.resource_group_name
  location             = var.location
  database_server_name = var.database_server_name
  admin_db_username    = var.admin_db_username
  db_passowrd          = var.db_passowrd
  database_name        = var.database_name
  start_ip_address     = var.start_ip_address
  end_ip_address       = var.end_ip_address
  postgres_backup_retention = var.postgres_backup_retention
  depends_on           = [azurerm_resource_group.RG]
}

#=========================  VMSS  ===========================================#

module "vmss" {
  source              = "./modules/vmss"
  resource_group_name = var.resource_group_name
  location            = var.location
  vmss_name           = var.vmss_name
  source_image_id     = var.source_image_id
  subnet_id           = module.Vnet.web_app_subnet_id
  backend_pool_id     = module.application_gateway.backend_pool_id
  depends_on = [azurerm_resource_group.RG,
  module.Vnet]
}


