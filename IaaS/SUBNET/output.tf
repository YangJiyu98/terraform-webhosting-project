output "az_subnet_id" {

  value = azurerm_subnet.subnet.id
}

output "az_subnet_name" {

  value = azurerm_subnet.subnet.name
}

output "az_subnet_address_prefix" {

  value = azurerm_subnet.subnet.address_prefixes
}

output "az_subnet_resource_group" {

  value = azurerm_subnet.subnet.resource_group_name
}

output "az_subnet_vnet" {
 
  value = azurerm_subnet.subnet.virtual_network_name
}