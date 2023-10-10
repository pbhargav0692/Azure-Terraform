terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = ">=3.51.0"
      }
    }
}

resource "azurerm_resource_group" "SLU_Primary" {
  name = "SLU_Primary_RG"
  location = "East US"
}