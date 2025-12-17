###############################################
## Azure Storage Account Custom Role Actions ##
###############################################

locals {
  # Azure Storage Account Owner Actions
  storage_account_owner_actions = [
    "Microsoft.Storage/storageAccounts/read",
    "Microsoft.Storage/register/action",
    "Microsoft.Storage/checknameavailability/read",
    "Microsoft.Storage/locations/checknameavailability/read",
    "Microsoft.Storage/locations/usages/read",
    "Microsoft.Storage/operations/read",
    "Microsoft.Storage/skus/read",
    "Microsoft.Storage/storageAccounts/listkeys/action",
    "Microsoft.Storage/storageAccounts/regeneratekey/action",
    "Microsoft.Storage/storageAccounts/rotateKey/action",
    "Microsoft.Storage/storageAccounts/listAccountSas/action",
    "Microsoft.Storage/storageAccounts/listServiceSas/action",
    "Microsoft.Storage/storageAccounts/revokeUserDelegationKeys/action",
    "Microsoft.Storage/storageAccounts/updateAutoRotateUserKeys/action",
    "Microsoft.Storage/storageAccounts/blobServices/*",
    "Microsoft.Storage/storageAccounts/fileServices/*",
    "Microsoft.Storage/storageAccounts/queueServices/*",
    "Microsoft.Storage/storageAccounts/tableServices/*",
    "Microsoft.Storage/storageAccounts/encryptionScopes/*",
    "Microsoft.Storage/storageAccounts/managementPolicies/*",
    "Microsoft.Storage/storageAccounts/objectReplicationPolicies/*",
    "Microsoft.Storage/storageAccounts/inventoryPolicies/*",
    "Microsoft.Storage/storageAccounts/providers/Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Storage/storageAccounts/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/blobServices/providers/Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Storage/storageAccounts/blobServices/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/fileServices/providers/Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Storage/storageAccounts/fileServices/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/queueServices/providers/Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Storage/storageAccounts/queueServices/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/tableServices/providers/Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Storage/storageAccounts/tableServices/providers/Microsoft.Insights/metricDefinitions/read",
  ]
  # Block Actions for Azure Storage Account Owner
  storage_account_owner_not_actions = [
    "Microsoft.Storage/storageAccounts/write",
    "Microsoft.Storage/storageAccounts/delete",
    "Microsoft.Storage/storageAccounts/PrivateEndpointConnectionsApproval/action",
    "Microsoft.Storage/storageAccounts/privateEndpointConnectionProxies/*",
    "Microsoft.Storage/storageAccounts/privateEndpointConnections/*",
    "Microsoft.Storage/storageAccounts/privateEndpoints/move/action",
    "Microsoft.Storage/storageAccounts/joinPerimeter/action",
    "Microsoft.Storage/storageAccounts/networkSecurityPerimeterConfigurations/action",
    "Microsoft.Storage/storageAccounts/networkSecurityPerimeterConfigurations/read",
    "Microsoft.Storage/storageAccounts/networkSecurityPerimeterAssociationProxies/write",
    "Microsoft.Storage/storageAccounts/networkSecurityPerimeterAssociationProxies/delete",
    "Microsoft.Storage/locations/deleteVirtualNetworkOrSubnets/action",
  ]

  # Azure Storage Account Developer Actions
  storage_account_developer_actions = [
    "Microsoft.Storage/storageAccounts/read",
    "Microsoft.Storage/register/action",
    "Microsoft.Storage/checknameavailability/read",
    "Microsoft.Storage/locations/checknameavailability/read",
    "Microsoft.Storage/locations/usages/read",
    "Microsoft.Storage/operations/read",
    "Microsoft.Storage/skus/read",
    "Microsoft.Storage/storageAccounts/listkeys/action",
    "Microsoft.Storage/storageAccounts/regeneratekey/action",
    "Microsoft.Storage/storageAccounts/rotateKey/action",
    "Microsoft.Storage/storageAccounts/listAccountSas/action",
    "Microsoft.Storage/storageAccounts/listServiceSas/action",
    "Microsoft.Storage/storageAccounts/revokeUserDelegationKeys/action",
    "Microsoft.Storage/storageAccounts/updateAutoRotateUserKeys/action",
    "Microsoft.Storage/storageAccounts/blobServices/*",
    "Microsoft.Storage/storageAccounts/fileServices/*",
    "Microsoft.Storage/storageAccounts/queueServices/*",
    "Microsoft.Storage/storageAccounts/tableServices/*",
    "Microsoft.Storage/storageAccounts/encryptionScopes/*",
    "Microsoft.Storage/storageAccounts/managementPolicies/*",
    "Microsoft.Storage/storageAccounts/objectReplicationPolicies/*",
    "Microsoft.Storage/storageAccounts/inventoryPolicies/*",
    "Microsoft.Storage/storageAccounts/providers/Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Storage/storageAccounts/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/blobServices/providers/Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Storage/storageAccounts/blobServices/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/fileServices/providers/Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Storage/storageAccounts/fileServices/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/queueServices/providers/Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Storage/storageAccounts/queueServices/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/tableServices/providers/Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Storage/storageAccounts/tableServices/providers/Microsoft.Insights/metricDefinitions/read",
  ]
  # Block Actions for Azure Storage Account Developer
  storage_account_developer_not_actions = [
    "Microsoft.Storage/storageAccounts/write",
    "Microsoft.Storage/storageAccounts/delete",
    "Microsoft.Storage/storageAccounts/PrivateEndpointConnectionsApproval/action",
    "Microsoft.Storage/storageAccounts/privateEndpointConnectionProxies/updatePrivateEndpointProperties/action",
    "Microsoft.Storage/storageAccounts/privateEndpointConnectionProxies/write",
    "Microsoft.Storage/storageAccounts/privateEndpointConnectionProxies/delete",
    "Microsoft.Storage/storageAccounts/privateEndpointConnections/write",
    "Microsoft.Storage/storageAccounts/privateEndpointConnections/delete",
    "Microsoft.Storage/storageAccounts/privateEndpoints/move/action",
    "Microsoft.Storage/storageAccounts/joinPerimeter/action",
    "Microsoft.Storage/storageAccounts/networkSecurityPerimeterConfigurations/action",
    "Microsoft.Storage/storageAccounts/networkSecurityPerimeterConfigurations/read",
    "Microsoft.Storage/storageAccounts/networkSecurityPerimeterAssociationProxies/write",
    "Microsoft.Storage/storageAccounts/networkSecurityPerimeterAssociationProxies/delete",
    "Microsoft.Storage/locations/deleteVirtualNetworkOrSubnets/action",
  ]

  # Reader Actions
  storage_account_reader = [
    "Microsoft.Storage/checknameavailability/read",
    "Microsoft.Storage/locations/checknameavailability/read",
    "Microsoft.Storage/locations/usages/read",
    "Microsoft.Storage/operations/read",
    "Microsoft.Storage/skus/read",
    "Microsoft.Storage/storageAccounts/read",
    "Microsoft.Storage/storageAccounts/blobServices/read",
    "Microsoft.Storage/storageAccounts/fileServices/read",
    "Microsoft.Storage/storageAccounts/queueServices/read",
    "Microsoft.Storage/storageAccounts/tableServices/read",
    "Microsoft.Storage/storageAccounts/blobServices/containers/read",
    "Microsoft.Storage/storageAccounts/fileServices/shares/read",
    "Microsoft.Storage/storageAccounts/queueServices/queues/read",
    "Microsoft.Storage/storageAccounts/tableServices/tables/read",
    "Microsoft.Storage/storageAccounts/encryptionScopes/read",
    "Microsoft.Storage/storageAccounts/managementPolicies/read",
    "Microsoft.Storage/storageAccounts/objectReplicationPolicies/read",
    "Microsoft.Storage/storageAccounts/inventoryPolicies/read",
    "Microsoft.Storage/storageAccounts/privateLinkResources/read",
    "Microsoft.Storage/storageAccounts/privateEndpointConnections/read",
    "Microsoft.Storage/storageAccounts/privateEndpointConnectionProxies/read",
    "Microsoft.Storage/storageAccounts/providers/Microsoft.Insights/diagnosticSettings/read",
    "Microsoft.Storage/storageAccounts/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/blobServices/providers/Microsoft.Insights/diagnosticSettings/read",
    "Microsoft.Storage/storageAccounts/blobServices/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/fileServices/providers/Microsoft.Insights/diagnosticSettings/read",
    "Microsoft.Storage/storageAccounts/fileServices/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/queueServices/providers/Microsoft.Insights/diagnosticSettings/read",
    "Microsoft.Storage/storageAccounts/queueServices/providers/Microsoft.Insights/metricDefinitions/read",
    "Microsoft.Storage/storageAccounts/tableServices/providers/Microsoft.Insights/diagnosticSettings/read",
    "Microsoft.Storage/storageAccounts/tableServices/providers/Microsoft.Insights/metricDefinitions/read",
  ]
}

###################################################
## Azure Storage Account Custom Role Definitions ##
###################################################

resource "random_uuid" "storage_account_owner_role_id" {}
resource "random_uuid" "storage_account_developer_role_id" {}
resource "random_uuid" "storage_account_reader_role_id" {}

# Storage Account Owner (tenant-level)
resource "azurerm_role_definition" "storage_account_owner" {
  name               = "KopiCloud Storage Account Owner"
  role_definition_id = random_uuid.storage_account_owner_role_id.result
  scope              = var.management_group_id
  description        = "Azure Storage Account Owner Custom Role"

  permissions {
    actions     = local.storage_account_owner_actions
    not_actions = local.storage_account_owner_not_actions
  }

  assignable_scopes = [var.management_group_id]
}

# Storage Account Developer (tenant-level)
resource "azurerm_role_definition" "storage_account_developer" {
  name               = "KopiCloud Storage Account Developer"
  role_definition_id = random_uuid.storage_account_developer_role_id.result
  scope              = var.management_group_id
  description        = "Azure Storage Account Developer Custom Role"

  permissions {
    actions     = local.storage_account_developer_actions
    not_actions = local.storage_account_developer_not_actions
  }

  assignable_scopes = [var.management_group_id]
}

# Storage Account Reader (tenant-level)
resource "azurerm_role_definition" "storage_account_reader" {
  name               = "KopiCloud Storage Account Reader"
  role_definition_id = random_uuid.storage_account_reader_role_id.result
  scope              = var.management_group_id
  description        = "Azure Storage Account Reader Role"

  permissions {
    actions     = local.storage_account_reader
    not_actions = []
  }

  assignable_scopes = [var.management_group_id]
}

################################################
## Azure Storage Account Custom Role - Output ##
################################################

output "tenant_storage_account_reader_role_name" {
  value = azurerm_role_definition.storage_account_reader.name
}

output "tenant_storage_account_reader_role_id" {
  value = random_uuid.storage_account_reader_role_id.result
}

output "tenant_storage_account_developer_role_name" {
  value = azurerm_role_definition.storage_account_developer.name
}

output "tenant_storage_account_developer_role_id" {
  value = random_uuid.storage_account_developer_role_id.result
}

output "tenant_storage_account_owner_role_name" {
  value = azurerm_role_definition.storage_account_owner.name
}

output "tenant_storage_account_owner_role_id" {
  value = random_uuid.storage_account_owner_role_id.result
}
