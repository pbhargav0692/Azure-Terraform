provider "azurerm" {
  version = "~> 2.0"
  features {}
}

resource "azurerm_network_security_group" "NSG-SSH-RDP" {
  name                = "SSH-RDP-nsg"
  location            = azurerm_resource_group.SLU_Primary.location
  resource_group_name = azurerm_resource_group.SLU_Primary.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "RDP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "NSG-Management" {
  subnet_id                 = azurerm_subnet.management.id
  network_security_group_id = azurerm_network_security_group.NSG-SSH-RDP.id
}