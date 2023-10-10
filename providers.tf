terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = ">=3.0.0"
      }
    }
}


provider "azurerm" {
  subscription_id = "4009a259-77df-4364-85de-2e59455811ef"
  client_id = ""
  client_secret = ""
  tenant_id = "24c50b87-30d2-4b89-8390-b297b4b18876"
  features {

  }

}