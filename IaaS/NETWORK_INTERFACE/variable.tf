variable "name" {
  description = "(Required) The name of the Security Group"
  default     = "cloud-network-interface"
}

variable "rgname" {
  
}

variable "location" {
  
}

variable "azure_subnet_id" {
  
}

variable "private_ip_allocation" {
  description = "(Required) The allocation method for IP. Possible values are Dynamic and Static"
  default     = "Dynamic"
}

variable "public_ip_id" {
  description = "(Required) The id of public Ip"
 
}
