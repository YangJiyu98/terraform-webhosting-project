resource "azurerm_public_ip" "az_public_ip" {
  name                = var.name
  resource_group_name = var.rgname
  location            = var.rglocation
  allocation_method   = var.allocation
  ip_version          = var.ip_version


}