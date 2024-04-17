terraform {
  backend "azurerm" {
    resource_group_name  = "RG-Rinshad"
    storage_account_name = "backend4rinshad"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    client_id       = "9e0cf4d7-dad9-4bf5-8427-74c4c1a7cc39"
    client_secret   = "pVa8Q~-H1-0sNp1F478XVgLqRs5.WB33fkTWYa83"
    tenant_id       = "61b2db07-fac4-4636-8c07-ab264dade2fa"
    subscription_id = "a1959dd9-b11d-4f5c-aa2e-e85c59dbe727"
  }
}
