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



resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westus2"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind = "Linux"
  reserved = true
  sku {
    tier = "Standard"
    size = "S1"
  }
  
}

resource "azurerm_app_service" "example" {
  name                = "mingze-app-service-01"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    php_version = "7.4"
    scm_type    = "LocalGit"
  }


}

resource "azurerm_sql_server" "sqldb" {
  name                         = "sqldb-mingze-01"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "mingzedb"
  administrator_login_password = "Wofeichangai$98"
}

resource "azurerm_sql_database" "db" {
  name                = "db-mingze-01"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  server_name         = azurerm_sql_server.sqldb.name
}





