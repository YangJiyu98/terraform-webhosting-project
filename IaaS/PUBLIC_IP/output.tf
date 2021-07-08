output "az_public_ip_address" {
  description = "The address of the newly created Public IP"
  value       = azurerm_public_ip.az_public_ip.ip_address
}

output "az_public_ip_id" {
  description = "The id of the newly created Public IP"
  value       = azurerm_public_ip.az_public_ip.id
}

output "az_public_ip_name" {
  description = "The name of the newly created Public IP"
  value       = var.name
}