provider "azurerm" {
  features {}
  skip_provider_registration = true
}


terraform {
  backend "azurerm" {
    resource_group_name   = "storage"
    storage_account_name  = "2525storage"
    container_name        = "prod"
    key                   = "prod-terraform.tfstate"
  }
  
}