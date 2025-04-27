#===========================Resource Group Info =========================================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

#===========================VM Info =========================================
variable "VM_subnet_id" {
  description = "Subnet Id in the Vnet"
  type        = string
}

variable "VM" {
  description = "Virtual machine (VM) Name"
  type        = string
}

variable "adminUserName" {
  description = "Username for the ssh admin key"
  type        = string
}
