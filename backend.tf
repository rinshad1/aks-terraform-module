terraform {
  backend "azurerm" {
    resource_group_name  = "RG-Rinshad"
    storage_account_name = "backend4rinshad"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
