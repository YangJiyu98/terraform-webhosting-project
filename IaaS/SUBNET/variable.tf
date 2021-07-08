variable "vnet_name" {
  description = "(Required) The name of an existing virtual network to be imported."
  type        = string
}

variable "subnet_name" {
  description = "(Required) The name of the virtual network"
  default     = "cloud-subnet"
}

variable "rg_name" {}

variable "address_prefix" {
  description = "(Required) The address prefix that is used by the subnet."
  type        = string
  default     = "10.0.2.0/26"
}