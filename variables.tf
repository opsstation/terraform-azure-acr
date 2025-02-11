variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "managedby" {
  type        = string
  default     = ""
  description = "ManagedBy, eg 'OpsStation'."
}

variable "enable" {
  type        = bool
  default     = true
  description = "Flag to control module creation."
}



variable "resource_group_name" {
  type        = string
  default     = ""
  description = "A container that holds related resources for an Azure solution"
}

variable "location" {
  type        = string
  default     = ""
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"

}

variable "container_registry_config" {
  type = object({
    name                      = string
    sku                       = optional(string)
    quarantine_policy_enabled = optional(bool)
    zone_redundancy_enabled   = optional(bool)
  })
  description = "Manages an Azure Container Registry"

}

variable "georeplications" {
  type = list(object({
    location                = string
    zone_redundancy_enabled = optional(bool)
  }))
  default     = []
  description = "A list of Azure locations where the container registry should be geo-replicated"
}

variable "network_rule_set" { # change this to match actual objects
  type = object({
    default_action = optional(string)
    ip_rule = optional(list(object({
      ip_range = string
    })))
    virtual_network = optional(list(object({
      subnet_id = string
    })))
  })
  default     = null
  description = "Manage network rules for Azure Container Registries"
}

variable "retention_policy" {
  type = object({
    days    = optional(number)
    enabled = optional(bool)
  })
  default = {
    days    = 10
    enabled = true
  }
  description = "Set a retention policy for untagged manifests"
}

variable "enable_content_trust" {
  type        = bool
  default     = true
  description = "Boolean value to enable or disable Content trust in Azure Container Registry"
}

variable "identity_ids" {
  type        = any
  default     = null
  description = "Specifies a list of user managed identity ids to be assigned. This is required when `type` is set to `UserAssigned` or `SystemAssigned, UserAssigned`"
}

variable "encryption" {
  type = object({
    key_vault_key_id   = string
    identity_client_id = string
  })
  default     = null
  description = "Encrypt registry using a customer-managed key"
}

variable "scope_map" {
  type = map(object({
    actions = list(string)
  }))
  default     = null
  description = "Manages an Azure Container Registry scope map. Scope Maps are a preview feature only available in Premium SKU Container registries."
}

variable "container_registry_webhooks" {
  type = map(object({
    service_uri    = string
    actions        = list(string)
    status         = optional(string)
    scope          = string
    custom_headers = map(string)
  }))
  default     = null
  description = "Manages an Azure Container Registry Webhook"
}

variable "enable_private_endpoint" {
  type        = bool
  default     = true
  description = "Manages a Private Endpoint to Azure Container Registry"

}

variable "existing_private_dns_zone" {
  type        = string
  default     = null
  description = "Name of the existing private DNS zone"

}

variable "private_dns_name" {
  type    = string
  default = "privatelink.azurecr.io"
}

variable "subnet_id" {
  type        = list(string)
  default     = null
  description = "Subnet to be used for private endpoint"
}

variable "virtual_network_id" {
  type        = string
  default     = null
  description = "Virtual Network to be used for private endpoint"
}

variable "private_dns_zone_vnet_link_registration_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?"
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "To denied public access "
}

variable "admin_enabled" {
  type        = bool
  default     = true
  description = "To enable of disable admin access"
}

variable "existing_private_dns_zone_resource_group_name" {
  type        = string
  default     = null
  description = "The name of the existing resource group"
}

variable "alias_sub" {
  type        = string
  default     = null
  description = "Subscription id for different sub in which dns zone is present."
}

##-----------------------------------------------------------------------------
## To be set when existing dns zone is in diffrent subscription.
##-----------------------------------------------------------------------------
variable "diff_sub" {
  type        = bool
  default     = false
  description = "Flag to tell whether dns zone is in different sub or not."
}

variable "multi_sub_vnet_link" {
  type        = bool
  default     = false
  description = "Flag to control creation of vnet link for dns zone in different subscription"
}

variable "addon_vent_link" {
  type        = bool
  default     = false
  description = "The name of the addon vnet "
}

variable "addon_virtual_network_id" {
  type        = string
  default     = ""
  description = "The name of the addon vnet link vnet id"
}

variable "same_vnet" {
  type        = bool
  default     = false
  description = "Variable to be set when multiple acr having common DNS in same vnet."
}

variable "existing_private_dns_zone_id" {
  type        = string
  default     = null
  description = "ID of existing private dns zone. To be used in dns configuration group in private endpoint."
}