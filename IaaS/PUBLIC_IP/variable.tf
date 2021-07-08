variable "name" {
    default     = "cloud-public-ip"
}

variable "rgname" {
  
}

variable "rglocation" {
  
}

variable "allocation" {
  description = "(Required) The allocation method if this IP address. Possible values are Static or Dynamic"
  default     = "cloud-security-rule"
}

variable "ip_version" { 
  description = "(Optional) The Ip version. Possible values are IPv4 and IPv6"
  default     = "IPv4"
}