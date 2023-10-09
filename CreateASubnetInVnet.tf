provider "azurerm" {
  version = "~> 2.0"
  features {}
}

resource "azurerm_subnet" "devsubnet" {
  name = "dev-subnet"
  resource_group_name = azurerm_resource_group.main.name
  address_prefixes = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.mainnetwork.name
}

resource "azurerm_subnet" "testsubnet" {
  name = "test-subnet"
  resource_group_name = azurerm_resource_group.main.name
  address_prefixes = ["10.0.2.0/24"]
  virtual_network_name = azurerm_virtual_network.mainnetwork.name
}
