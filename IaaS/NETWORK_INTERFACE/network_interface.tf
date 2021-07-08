resource "azurerm_network_interface" "az_network_interface" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.azure_subnet_id
    private_ip_address_allocation = var.private_ip_allocation
    public_ip_address_id          = var.public_ip_id
  }
#   tags = {
#     Region      = data.azurerm_resource_group.azure_rg.location
#     Team        = var.team_tag
#     Environment = var.env
#     Creator     = var.creator
#   }
}