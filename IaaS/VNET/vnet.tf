resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-1"
  resource_group_name = var.rgname
  location            = var.location
  address_space      = var.address
}

