provider "azurerm" {
  features {}
  skip_provider_registration = true
}


terraform {
  backend "azurerm" {
    resource_group_name   = "mat-delete-krna"
    storage_account_name  = "kadirst25"
    container_name        = "con"
    key                   = "dev-terraform.tfstate"
  }
}
