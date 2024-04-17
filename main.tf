provider "azurerm" {
  features {
  resource_group {
     prevent_deletion_if_contains_resources = false
     }
  }
  client_id       = "9e0cf4d7-dad9-4bf5-8427-74c4c1a7cc39"
  client_secret   = "pVa8Q~-H1-0sNp1F478XVgLqRs5.WB33fkTWYa83"
  tenant_id       = "61b2db07-fac4-4636-8c07-ab264dade2fa"
  subscription_id = "a1959dd9-b11d-4f5c-aa2e-e85c59dbe727"
}

resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name
  location = var.location
}

module "ServicePrincipal" {
  source                 = "./modules/ServicePrincipal"
  service_principal_name = var.service_principal_name

  depends_on = [
    azurerm_resource_group.rg1
  ]
}

resource "azurerm_role_assignment" "rolespn" {

  scope                = var.subscription
  role_definition_name = var.role_definition
  principal_id         = module.ServicePrincipal.service_principal_object_id

  depends_on = [
    module.ServicePrincipal
  ]
}

module "vnet_aks" {
  source                    = "./modules/vnet"
  vnet_name                 = var.vnet_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  network_address_space     = var.network_address_space
  aks_subnet_address_prefix = var.aks_subnet_address_prefix
  aks_subnet_address_name   = var.aks_subnet_address_name
}

#create Azure Kubernetes Service
module "aks" {
  source                 = "./modules/aks"
  cluster_name           = var.cluster_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  service_principal_name = var.service_principal_name
  client_id              = module.ServicePrincipal.client_id
  client_secret          = module.ServicePrincipal.client_secret
  vnet_subnet_id         = module.vnet_aks.aks_subnet_id
  node_pool_name         = var.node_pool_name
  vm_size                = var.vm_size
  zones                  = var.zones
  enable_auto_scaling    = var.enable_auto_scaling
  min_count              = var.min_count
  max_count              = var.max_count
  os_disk_size_gb        = var.os_disk_size_gb
  node_pool_type         = var.node_pool_type
  network_plugin         = var.network_plugin
  load_balancer_sku      = var.load_balancer_sku
  outbound_type          = var.outbound_type

  depends_on = [
    module.ServicePrincipal,
    module.vnet_aks
  ]
}
