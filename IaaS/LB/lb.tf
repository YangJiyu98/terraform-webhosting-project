# resource "azurerm_resource_group" "example" {
#   name     = "LoadBalancerRG"
#   location = "West Europe"
# }

# resource "azurerm_public_ip" "example" {
#   name                = "PublicIPForLB"
#   location            = "West US"
#   resource_group_name = azurerm_resource_group.example.name
#   allocation_method   = "Static"
# }

resource "azurerm_lb" "lb" {
  name                = var.lbname
  location            = var.lblocation
  resource_group_name = var.rg_name

  # frontend_ip_configuration {
  #   name                 = var.front_ip_name
  #   public_ip_address_id = var.public_ip_address
  # }
}