variable "resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "cluster_name" {
  type = string
}

variable "vnet_name" {
  type        = string
  description = "vnet name"
}

variable "location" {
  type    = string
}

variable "service_principal_name" {
  type = string
}

variable "network_address_space" {
}

variable "aks_subnet_address_prefix" {
}

variable "aks_subnet_address_name" {
}

variable "node_pool_name" {
  type        = string
  description = "node pool name"
}

variable "vm_size" {
  type        = string
  description = "node pool vm size"
}

variable "enable_auto_scaling" {
  type        = string
  description = "node pool autoscaling"
}

variable "max_count" {
  type        = number
  description = "node pool maximum count"
}
variable "min_count" {
  type        = number
  description = "node pool minimum count"
}

variable "os_disk_size_gb" {
  type        = number
  description = "node pool disk size"
}

variable "node_pool_type" {
  type        = string
  description = "node pool type"
}

variable "zones" {
  type        = list(any)
  description = "node pool type"
}

variable "network_plugin" {
  type        = string
  description = "node pool network plugin"
}

variable "load_balancer_sku" {
  type        = string
  description = "node pool load balancer"
}

variable "outbound_type" {
  type        = string
  description = "node pool outbond type"
}

variable "subscription" {
  type        = string
  description = "azurerm_role_assignment scope"
}

variable "role_definition" {
  type        = string
  description = "azurerm_role_assignment role_definition"
}