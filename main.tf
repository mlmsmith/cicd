terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0.2"
    }
  }
  required_version = ">=1.1.0"
}

# provider and configuration block
# This declares and configures the AzureRM (Azure Resource Manager) provider for Terraform

provider "azurerm" {
  features {}
}