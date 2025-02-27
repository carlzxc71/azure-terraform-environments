variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "location_short" {
  description = "Azure Region Short"
  type        = string
}

variable "common_name" {
  description = "Common Name"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual Network Address Space"
  type        = list(string)
}

variable "subnet_address_config" {
  description = "Subnet address configuration"
  type = map(object({
    name = string
    cidr = list(string)
    delegation = optional(object({
      name = string
      service_delegation = object({
        name    = string
        actions = list(string)
      })
    }))
  }))
}
