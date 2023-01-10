terraform {
  required_version = ">= 1"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.11.0, < 4.0"
    }
    curl = {
      source  = "anschoewe/curl"
      version = "1.0.2"
    }
  }
}
