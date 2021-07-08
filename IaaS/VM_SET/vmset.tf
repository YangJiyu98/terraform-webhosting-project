resource "azurerm_availability_set" "avset" {
 name                         = var.name
 location                     = var.rglocation
 resource_group_name          = var.rgname
 platform_fault_domain_count  = var.fault_domain_count
 platform_update_domain_count = var.update_domain_count
 managed                      = true
}