provider "azurerm" {
  features {}
  skip_provider_registration = true
}

terraform {
  backend "azurerm" {
    resource_group_name   = "storage-rg"
    storage_account_name  = "terrastorage25"
    container_name        = "st-con"
    key                   = "stage-terraform.tfstate"
  }
  
}
