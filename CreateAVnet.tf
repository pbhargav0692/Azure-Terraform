provider "azurerm" {
  version = "~> 2.0"
  features {}
}

resource "azurerm_virtual_network" "SLU_Primary_VN" {
  name = "SLU_Primary_RG_VN"
  location = azurerm_resource_group.SLU_Primary.location
  resource_group_name = azurerm_resource_group.SLU_Primary.name
  address_space = ["172.24.0.0/16"]
}
