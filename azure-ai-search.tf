#########################################
## Azure AI Search Custom Role Actions ##
#########################################

locals {
  # Azure AI Search Owner Actions
  ai_search_owner_actions = [
    "Microsoft.Search/searchServices/indexes/*",
    "Microsoft.Search/searchServices/indexers/*",
    "Microsoft.Search/searchServices/dataSources/*",
    "Microsoft.Search/searchServices/skillsets/*",
    "Microsoft.Search/searchServices/synonymMaps/*",
    "Microsoft.Search/operations/read",
    "Microsoft.Search/offerings/read",
    "Microsoft.Search/checkNameAvailability/action",
    "Microsoft.Search/searchServices/read",
    "Microsoft.Search/searchServices/start/action",
    "Microsoft.Search/searchServices/stop/action",
    "Microsoft.Search/searchServices/listAdminKeys/action",
    "Microsoft.Search/searchServices/regenerateAdminKey/action",
    "Microsoft.Search/searchServices/listQueryKeys/action",
    "Microsoft.Search/searchServices/createQueryKey/action",
    "Microsoft.Search/searchServices/deleteQueryKey/delete",
    "Microsoft.Search/searchServices/metricDefinitions/read",
    "Microsoft.Search/searchServices/logDefinitions/read",
    "Microsoft.Search/searchServices/diagnosticSettings/read",
    "Microsoft.Search/searchServices/diagnosticSettings/write",
    "Microsoft.Search/searchServices/debugSessions/read",
    "Microsoft.Search/searchServices/debugSessions/write",
    "Microsoft.Search/searchServices/debugSessions/delete",
    "Microsoft.Search/searchServices/debugSessions/execute/action"
  ]
  # Block Actions for Azure AI Search Owner 
  ai_search_owner_not_actions = [
    "Microsoft.Search/searchServices/write",
    "Microsoft.Search/searchServices/delete",
    "Microsoft.Search/searchServices/privateEndpointConnectionsApproval/action",
    "Microsoft.Search/searchServices/privateEndpointConnections/read",
    "Microsoft.Search/searchServices/privateEndpointConnections/write",
    "Microsoft.Search/searchServices/privateEndpointConnections/delete",
    "Microsoft.Search/searchServices/privateEndpointConnectionProxies/validate/action",
    "Microsoft.Search/searchServices/privateEndpointConnectionProxies/read",
    "Microsoft.Search/searchServices/privateEndpointConnectionProxies/write",
    "Microsoft.Search/searchServices/privateEndpointConnectionProxies/delete",
    "Microsoft.Search/searchServices/sharedPrivateLinkResources/read",
    "Microsoft.Search/searchServices/sharedPrivateLinkResources/write",
    "Microsoft.Search/searchServices/sharedPrivateLinkResources/delete",
    "Microsoft.Search/searchServices/sharedPrivateLinkResources/operationStatuses/read",
    "Microsoft.Search/locations/notifyNetworkSecurityPerimeterUpdatesAvailable/write",
    "Microsoft.Search/searchServices/networkSecurityPerimeterAssociationProxies/read",
    "Microsoft.Search/searchServices/networkSecurityPerimeterAssociationProxies/write",
    "Microsoft.Search/searchServices/networkSecurityPerimeterAssociationProxies/delete",
    "Microsoft.Search/searchServices/networkSecurityPerimeterConfigurations/read",
    "Microsoft.Search/searchServices/networkSecurityPerimeterConfigurations/reconcile/action",
  ]

  # Azure AI Search Developer Actions
  ai_search_developer_actions = [
    "Microsoft.Search/searchServices/listAdminKeys/action",
    "Microsoft.Search/searchServices/listQueryKeys/action", ## read keys
    "Microsoft.Search/searchServices/indexes/*",
    "Microsoft.Search/searchServices/indexers/*",
    "Microsoft.Search/searchServices/dataSources/*",
    "Microsoft.Search/searchServices/skillsets/*",
    "Microsoft.Search/searchServices/synonymMaps/*",
    "Microsoft.Search/operations/read",
    "Microsoft.Search/offerings/read",
    "Microsoft.Search/searchServices/read",
    "Microsoft.Search/searchServices/metricDefinitions/read",
    "Microsoft.Search/searchServices/logDefinitions/read",
    "Microsoft.Search/searchServices/debugSessions/read",
    "Microsoft.Search/searchServices/debugSessions/write",
    "Microsoft.Search/searchServices/debugSessions/delete",
    "Microsoft.Search/searchServices/debugSessions/execute/action"
  ]
  # Block Actions for Azure AI Search Developer
  ai_search_developer_not_actions = [
    "Microsoft.Search/searchServices/write",
    "Microsoft.Search/searchServices/delete",
    "Microsoft.Search/searchServices/start/action",
    "Microsoft.Search/searchServices/stop/action",
    "Microsoft.Search/searchServices/regenerateAdminKey/action",
    "Microsoft.Search/searchServices/listQueryKeys/action",
    "Microsoft.Search/searchServices/createQueryKey/action",
    "Microsoft.Search/searchServices/deleteQueryKey/delete",
    "Microsoft.Search/searchServices/diagnosticSettings/write",
    "Microsoft.Search/searchServices/privateEndpointConnectionsApproval/action",
    "Microsoft.Search/searchServices/privateEndpointConnections/read",
    "Microsoft.Search/searchServices/privateEndpointConnections/write",
    "Microsoft.Search/searchServices/privateEndpointConnections/delete",
    "Microsoft.Search/searchServices/privateEndpointConnectionProxies/validate/action",
    "Microsoft.Search/searchServices/privateEndpointConnectionProxies/read",
    "Microsoft.Search/searchServices/privateEndpointConnectionProxies/write",
    "Microsoft.Search/searchServices/privateEndpointConnectionProxies/delete",
    "Microsoft.Search/searchServices/sharedPrivateLinkResources/read",
    "Microsoft.Search/searchServices/sharedPrivateLinkResources/write",
    "Microsoft.Search/searchServices/sharedPrivateLinkResources/delete",
    "Microsoft.Search/searchServices/sharedPrivateLinkResources/operationStatuses/read",
    "Microsoft.Search/locations/notifyNetworkSecurityPerimeterUpdatesAvailable/write",
    "Microsoft.Search/searchServices/networkSecurityPerimeterAssociationProxies/read",
    "Microsoft.Search/searchServices/networkSecurityPerimeterAssociationProxies/write",
    "Microsoft.Search/searchServices/networkSecurityPerimeterAssociationProxies/delete",
    "Microsoft.Search/searchServices/networkSecurityPerimeterConfigurations/read",
    "Microsoft.Search/searchServices/networkSecurityPerimeterConfigurations/reconcile/action",
  ]

  # Reader Actions
  ai_search_reader = [
    "Microsoft.Search/searchServices/listAdminKeys/action",
    "Microsoft.Search/searchServices/read",
    "Microsoft.Search/searchServices/indexes/read",
    "Microsoft.Search/searchServices/indexers/read",
    "Microsoft.Search/searchServices/datasources/read",
    "Microsoft.Search/searchServices/skillsets/read",
    "Microsoft.Search/searchServices/synonymmaps/read",
    "Microsoft.Search/searchServices/debugSessions/read",
    "Microsoft.Search/searchServices/privateEndpointConnectionProxies/read",
    "Microsoft.Search/searchServices/privateEndpointConnections/read",
    "Microsoft.Search/searchServices/sharedPrivateLinkResources/read",
    "Microsoft.Search/searchServices/diagnosticSettings/read",
    "Microsoft.Search/searchServices/logDefinitions/read",
    "Microsoft.Search/searchServices/metricDefinitions/read",
    "Microsoft.Search/operations/read",
    "Microsoft.Search/offerings/read",
  ]
}

#############################################
## Azure AI Search Custom Role Definitions ##
#############################################

resource "random_uuid" "ai_search_owner_role_id" {}
resource "random_uuid" "ai_search_developer_role_id" {}
resource "random_uuid" "ai_search_reader_role_id" {}

# AI Search Owner (tenant-level)
resource "azurerm_role_definition" "ai_search_owner" {
  name               = "KopiCloud AI Search Owner"
  role_definition_id = random_uuid.ai_search_owner_role_id.result
  scope              = var.management_group_id
  description        = "Azure AI Search Owner Custom Role"

  permissions {
    actions     = local.ai_search_owner_actions
    not_actions = local.ai_search_owner_not_actions
  }

  assignable_scopes = [var.management_group_id]
}

# AI Search Developer (tenant-level)
resource "azurerm_role_definition" "ai_search_developer" {
  name               = "KopiCloud AI Search Developer"
  role_definition_id = random_uuid.ai_search_developer_role_id.result
  scope              = var.management_group_id
  description        = "Azure AI Search Developer Custom Role"

  permissions {
    actions     = local.ai_search_developer_actions
    not_actions = local.ai_search_developer_not_actions
  }

  assignable_scopes = [var.management_group_id]
}

# AI Search Reader (tenant-level)
resource "azurerm_role_definition" "ai_search_reader" {
  name               = "KopiCloud AI Search Reader"
  role_definition_id = random_uuid.ai_search_reader_role_id.result
  scope              = var.management_group_id
  description        = "Azure AI Search Reader Role"

  permissions {
    actions     = local.ai_search_reader
    not_actions = []
  }

  assignable_scopes = [var.management_group_id]
}

##########################################
## Azure AI Search Custom Role - Output ##
##########################################

output "tenant_ai_search_reader_role_name" {
  value = azurerm_role_definition.ai_search_reader.name
}

output "tenant_ai_search_reader_role_id" {
  value = random_uuid.ai_search_reader_role_id.result
}

output "tenant_ai_search_developer_role_name" {
  value = azurerm_role_definition.ai_search_developer.name
}

output "tenant_ai_search_developer_role_id" {
  value = random_uuid.ai_search_developer_role_id.result
}

output "tenant_ai_search_owner_role_name" {
  value = azurerm_role_definition.ai_search_owner.name
}

output "tenant_ai_search_owner_role_id" {
  value = random_uuid.ai_search_owner_role_id.result
}
