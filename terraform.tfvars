resource_group_name       = "test-rinshad-rg"
cluster_name              = "rinshad-aks"
vnet_name                 = "aks_vnet"
location                  = "canadacentral"

service_principal_name    = "test-rinshad-spn"

aks_subnet_address_name   = "aks-subnet"
network_address_space     = "192.168.0.0/16"
aks_subnet_address_prefix = "192.168.0.0/24"

node_pool_name            = "defaultpool"
vm_size                   = "Standard_DS2_v2"
enable_auto_scaling       = "true"
max_count                 = 5
min_count                 = "4"
os_disk_size_gb           = 30
node_pool_type            = "VirtualMachineScaleSets"
zones                     = [1, 2, 3]

network_plugin            = "azure"
load_balancer_sku         = "standard"
outbound_type             = "loadBalancer"

subscription              = "/subscriptions/a1959dd9-b11d-4f5c-aa2e-e85c59dbe727"
role_definition           = "Contributor"
