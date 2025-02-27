azure_subscription_id = ""
environment           = "dev"
common_name           = "network"
location              = "swedencentral"
location_short        = "sc"
vnet_address_space    = ["10.0.0.0/24"]

subnet_address_config = {
  container = {
    name = "sn-container-workload"
    cidr = ["10.0.0.0/26"]
    delegation = {
      name = "acidelegation"
      service_delegation = {
        name    = "Microsoft.ContainerInstance/containerGroups"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }
  }
  server = {
    name = "sn-server-workload"
    cidr = ["10.0.0.64/26"]
  }
}
