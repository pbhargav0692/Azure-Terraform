provider "azurerm" {
  version = "~> 2.0"
  features {}
}

resource "azurerm_virtual_network" "production_rg" {
  name = "production_rg_vn"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space = ["172.24.0.0/16"]
}
