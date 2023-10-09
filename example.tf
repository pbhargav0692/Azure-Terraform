provider "azurerm" {
  version = "~> 2.0"
  features {}
}

resource "azurerm_resource_group" "example" {
  name = "example-resource-group"
  location = "West US"
}

resource "azurerm_virtual_network" "example" {
  name = "example-virtual-network"
  address_space = "10.0.0.0/16"
  location = "West US"
}

resource "azurerm_subnet" "example" {
  name = "example-subnet"
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "example" {
  name = "example-public-ip"
  location = "West US"
  allocation_method = "Dynamic"
}

resource "azurerm_network_interface" "example" {
  name = "example-network-interface"
  location = "West US"
  ip_configuration {
    name = "example-ip-configuration"
    subnet_id = azurerm_subnet.example.id
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_virtual_machine" "example" {
  name = "example-virtual-machine"
  location = "West US"
  machine_type = "Standard_D2s_v3"
  boot_disk {
    initialize_params {
      image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "18.04-LTS"
        version = "latest"
      }
    }
  }
  network_interface {
    network_interface_id = azurerm_network_interface.example.id
  }
}

output "public_ip" {
  value = azurerm_public_ip.example.ip_address
}