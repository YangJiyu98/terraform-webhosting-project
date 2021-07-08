# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

}
provider "azurerm" {
  features {}
}

module "rg" {
  source = "./RG"
  name="rg2"

  location="westus2"
}

module "vnet" {
  source = "./VNET"
  rgname = module.rg.name
  
  address       = ["10.0.0.0/16"]
  location="westus2"
}

module "subnet" {
  source = "./SUBNET"
  subnet_name="mingze-subnet"
  rg_name=module.rg.name
  vnet_name=module.vnet.name
  address_prefix="10.0.2.0/26"
}

module "az_public_ip" {
  source = "./PUBLIC_IP"
  name="mingze-public_ip-02"
  rglocation=module.rg.location
  rgname=module.rg.name
  allocation="Dynamic"
  ip_version="IPv4"
  #env
}

module "az_network_interface" {
  source                = "./NETWORK_INTERFACE"
  name                  = "mingze-network-interface"
  rgname   = module.rg.name
  location = module.rg.location
  # vnet_name             = module.vnet.name
  # subnet_name           = module.subnet.az_subnet_name
  azure_subnet_id       = module.subnet.az_subnet_id
  private_ip_allocation = "Dynamic"
  public_ip_id          = module.az_public_ip.az_public_ip_id
  # public_ip_name        = module.az_public_ip.az_public_ip_name
}

# module "azurerm_lb" {
#   source = "./LB"
#   lbname="mingze-lb"
#   lblocation=module.rg.location
#   rg_name=module.rg.name
#   # front_ip_name="mingze-PublicIPAddress"
#   # public_ip_address=module.az_public_ip.az_public_ip_id
# }



module "azurerm_availability_set" {
  source = "./VM_SET"
  name="avset"
  rglocation=module.rg.location
  rgname=module.rg.name
  fault_domain_count=2
  update_domain_count=2
  
}

module "az_virtual_machine" {
  source                 = "./VM"
  # name                   = "mingze-vm-01"
  count_num                 = 2
  name                  = "mingze-vm${2}"
  rg_name    = module.rg.name

  availability_set_id   = module.azurerm_availability_set.azurerm_availability_set_id

  # network_interface_name = module.az_network_interface.az_network_interface_name


  # network_interface_id   = module.az_network_interface.az_network_interface_id
  network_interface_ids = [element(module.az_network_interface.*.az_network_interface_id, 2)]

  size_vm                = "Standard_D2_v2"
  os_disk_name           = "mingze-vm-disk"
  os_profile_name        = "mingze-vm-host"
  os_profile_username    = "mingze"
  os_profile_password    = "Woaichi$98"
  # env                    = "dev"


}

