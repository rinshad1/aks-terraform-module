terraform {
  backend "azurerm" {
    resource_group_name  = "DefaultResourceGroup-EUS"
    storage_account_name = "backend4rinshad"
    container_name       = "tfstate2"
    key                  = "terraform.tfstate"
  }
}
