provider "azurerm" {
  version = "~> 2.0"
  features {}
}

resource "azurerm_subnet" "management" {
  name = "management-sn"
  resource_group_name = azurerm_resource_group.SLU_Primary.name
  address_prefixes = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.SLU_Primary_VN.name
}

resource "azurerm_subnet" "dmz" {
  name = "dmz-sn"
  resource_group_name = azurerm_resource_group.SLU_Primary.name
  address_prefixes = ["10.0.2.0/24"]
  virtual_network_name = azurerm_virtual_network.SLU_Primary_VN.name
}
