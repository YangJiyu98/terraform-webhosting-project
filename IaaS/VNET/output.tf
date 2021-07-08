
output "name" {
  value = azurerm_virtual_network.vnet.name
}

output "address" {
  value = azurerm_virtual_network.vnet.address_space
}

output "resource_group_name" {
  value = azurerm_virtual_network.vnet.resource_group_name
}