terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.20.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${var.environment}-${var.location_short}-${var.common_name}"
  location = var.location
}

resource "azurerm_virtual_network" "this" {
  name                = "vnet-${var.environment}-${var.location_short}-${var.common_name}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "this" {
  for_each = var.subnet_address_config

  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.cidr

  dynamic "delegation" {
    for_each = {
      for s in ["this"] : s => s
      if var.subnet_address_config[each.key].delegation != null
    }
    content {
      name = each.value.delegation.name
      service_delegation {
        name    = each.value.delegation.service_delegation.name
        actions = each.value.delegation.service_delegation.actions
      }
    }
  }
}
