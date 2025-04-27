subscription_id     = "" #use your subsctiption Id
resource_group_name = "Milestone2"
location            = "eastus" #use your location
#======================= varibales for Vnet modules =======================
Vnet_Name                       = "WebVnet"
VM_subnet                       = "VMsSubnet"
/* application_gateway_subnet_name = "applicationGatewaySubnet" */
#======================= varibales for VM modules =======================
VM            = "ChromaDBVM"
adminUserName = "azureuser"


#======================= varibales for storage modules =======================
container = "chat-history"

#======================= varibales for db modules =======================
database_server_name = "postgresqldbs"
database_name        = "chatbotdb"
admin_db_username    = "azureadmin"
db_passowrd          = "dbserverdata2"
start_ip_address     = "0.0.0.0"
end_ip_address       = "255.255.255.255"
postgres_backup_retention = 7
