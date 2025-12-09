#######################################
## Managed Redis Custom Role Actions ##
#######################################

locals {
  # Tenant-level root for these roles = management group
  role_root_scope = var.management_group_id

  # Azure Managed Redis Owner Actions
  managed_redis_owner_actions = [
    "Microsoft.Cache/operations/read",
    "Microsoft.Cache/locations/*",
    # Redis clusters + databases
    "Microsoft.Cache/redisEnterprise/read",
    "Microsoft.Cache/redisEnterprise/databases/*",
    # Allow read-only PE metadata
    "Microsoft.Cache/redisEnterprise/privateLinkResources/read",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnections/read",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnectionProxies/read",
  ]
  # Block Actions for Azure Managed Redis Owner 
  managed_redis_owner_not_actions = [
    "Microsoft.Cache/redisEnterprise/write",
    "Microsoft.Cache/redisEnterprise/PrivateEndpointConnectionsApproval/action",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnections/write",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnections/delete",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnectionProxies/write",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnectionProxies/delete",
  ]

  # Azure Managed Redis Developer Actions
  managed_redis_developer_actions = [
    "Microsoft.Cache/operations/read",
    "Microsoft.Cache/locations/asyncOperations/read",
    "Microsoft.Cache/locations/operationsStatus/read",
    "Microsoft.Cache/locations/operationResults/read",
    "Microsoft.Cache/redisEnterprise/read",
    "Microsoft.Cache/redisEnterprise/operationResults/read",
    "Microsoft.Cache/redisEnterprise/databases/read",
    "Microsoft.Cache/redisEnterprise/databases/write",
    "Microsoft.Cache/redisEnterprise/databases/operationResults/read",
    # allow reading keys
    "Microsoft.Cache/redisEnterprise/databases/listKeys/action",
    "Microsoft.Cache/redisEnterprise/databases/import/action",
    "Microsoft.Cache/redisEnterprise/databases/export/action",
    # read-only PE info
    "Microsoft.Cache/redisEnterprise/privateLinkResources/read",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnections/read",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnectionProxies/read",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnectionProxies/validate/action",
    "Microsoft.Cache/redisEnterprise/providers/Microsoft.Insights/metricDefinitions/read",
  ]
  # Block Actions for Azure Managed Redis Developer
  managed_redis_developer_not_actions = [
    "Microsoft.Cache/redisEnterprise/write",
    "Microsoft.Cache/redisEnterprise/delete",
    "Microsoft.Cache/redisEnterprise/databases/delete",
    "Microsoft.Cache/redisEnterprise/databases/regenerateKey/action",
    "Microsoft.Cache/redisEnterprise/PrivateEndpointConnectionsApproval/action",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnections/write",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnections/delete",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnectionProxies/write",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnectionProxies/delete",
  ]

  # Reader Actions
  managed_redis_reader = [
    "Microsoft.Cache/operations/read",
    "Microsoft.Cache/locations/asyncOperations/read",
    "Microsoft.Cache/locations/operationsStatus/read",
    "Microsoft.Cache/locations/operationResults/read",
    "Microsoft.Cache/redisEnterprise/read",
    "Microsoft.Cache/redisEnterprise/operationResults/read",
    "Microsoft.Cache/redisEnterprise/databases/read",
    "Microsoft.Cache/redisEnterprise/databases/operationResults/read",
    "Microsoft.Cache/redisEnterprise/privateLinkResources/read",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnections/read",
    "Microsoft.Cache/redisEnterprise/privateEndpointConnectionProxies/read",
    "Microsoft.Cache/redisEnterprise/providers/Microsoft.Insights/metricDefinitions/read",
  ]
}

###########################################################
## Managed Redis Custom Role Definitions at TENANT Scope ##
###########################################################

resource "random_uuid" "managed_redis_owner_role_id" {}
resource "random_uuid" "managed_redis_developer_role_id" {}
resource "random_uuid" "managed_redis_reader_role_id" {}

# Managed Redis Owner (tenant-level)
resource "azurerm_role_definition" "managed_redis_owner" {
  name               = "KopiCloud Managed Redis Owner"
  role_definition_id = random_uuid.managed_redis_owner_role_id.result
  scope              = local.role_root_scope
  description        = "Azure Managed Redis Owner Custom Role"

  permissions {
    actions     = local.managed_redis_owner_actions
    not_actions = local.managed_redis_owner_not_actions
  }

  assignable_scopes = [local.role_root_scope]
}

# Managed Redis Developer (tenant-level)
resource "azurerm_role_definition" "managed_redis_developer" {
  name               = "KopiCloud Managed Redis Developer"
  role_definition_id = random_uuid.managed_redis_developer_role_id.result
  scope              = local.role_root_scope
  description        = "Azure Managed Redis Developer Custom Role"

  permissions {
    actions     = local.managed_redis_developer_actions
    not_actions = local.managed_redis_developer_not_actions
  }

  assignable_scopes = [local.role_root_scope]
}

# Managed Redis Reader (tenant-level)
resource "azurerm_role_definition" "managed_redis_reader" {
  name               = "KopiCloud Managed Redis Reader"
  role_definition_id = random_uuid.managed_redis_reader_role_id.result
  scope              = local.role_root_scope
  description        = "Azure Managed Redis Reader Role"

  permissions {
    actions     = local.managed_redis_reader
    not_actions = []
  }

  assignable_scopes = [local.role_root_scope]
}

###########################################
## Managed Redis Custom Role - Variables ##
###########################################

variable "management_group_id" {
  description = "Management group ID used as root scope for the custom roles. Example: /providers/Microsoft.Management/managementGroups/complete-this"
  type        = string
}

########################################
## Managed Redis Custom Role - Output ##
########################################

output "tenant_managed_redis_reader_role_name" {
  value = azurerm_role_definition.managed_redis_reader.name
}

output "tenant_managed_redis_reader_role_id" {
  value = random_uuid.managed_redis_reader_role_id.result
}

output "tenant_managed_redis_developer_role_name" {
  value = azurerm_role_definition.managed_redis_developer.name
}

output "tenant_managed_redis_developer_role_id" {
  value = random_uuid.managed_redis_developer_role_id.result
}

output "tenant_managed_redis_owner_role_name" {
  value = azurerm_role_definition.managed_redis_owner.name
}

output "tenant_managed_redis_owner_role_id" {
  value = random_uuid.managed_redis_owner_role_id.result
}
