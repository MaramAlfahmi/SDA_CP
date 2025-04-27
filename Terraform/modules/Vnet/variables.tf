#===========================Resource Group Info =========================================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}
#===========================Vnet Info =========================================
variable "Vnet_Name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "VM_subnet" {
  description = "Name of the Subnet"
  type        = string
}

variable "VM" {
  description = "Virtual machine (VM) Name"
  type        = string
}
