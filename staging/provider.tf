provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = "storage"
    storage_account_name  = "2525storage"
    container_name        = "stage"
    key                   = "stage-terraform.tfstate"
  }
  
}