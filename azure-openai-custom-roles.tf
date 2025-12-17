######################################
## Azure OpenAI Custom Role Actions ##
######################################

locals {
  # Azure OpenAI Owner Actions
  openai_owner_actions = [
    "Microsoft.CognitiveServices/*/read",
    "Microsoft.CognitiveServices/operations/read",
    "Microsoft.CognitiveServices/accounts/raiPolicies/*",
    "Microsoft.CognitiveServices/accounts/listKeys/action",
    "Microsoft.CognitiveServices/accounts/regenerateKey/action",
    # Manage deployments (allowed for Owner)
    "Microsoft.CognitiveServices/accounts/deployments/read",
    ##"Microsoft.CognitiveServices/accounts/deployments/write",
    ##"Microsoft.CognitiveServices/accounts/deployments/delete",
 ]
  # Block Actions for Azure OpenAI Owner 
  openai_owner_not_actions = [
    "Microsoft.CognitiveServices/accounts/write",
    "Microsoft.CognitiveServices/accounts/delete",
    "Microsoft.CognitiveServices/accounts/privateEndpointConnections/*",
  ]

  # Azure OpenAI Developer Actions
  openai_developer_actions = [
    "Microsoft.CognitiveServices/*/read",
    "Microsoft.CognitiveServices/operations/read",
    # Developers can SEE deployments but cannot create/modify them
    "Microsoft.CognitiveServices/accounts/deployments/read",
    # Read keys
    "Microsoft.CognitiveServices/accounts/listKeys/action",
  ]
  # Block Actions for Azure OpenAI Developer
  openai_developer_not_actions = [
    "Microsoft.CognitiveServices/accounts/write",
    "Microsoft.CognitiveServices/accounts/delete",
    "Microsoft.CognitiveServices/accounts/privateEndpointConnections/*",
    # Block deployment create/modify/delete
    "Microsoft.CognitiveServices/accounts/deployments/write",
    "Microsoft.CognitiveServices/accounts/deployments/delete",
  ]

  # Reader Actions
  openai_reader = [
    "Microsoft.CognitiveServices/*/read",
    "Microsoft.CognitiveServices/operations/read",
  ]
}

##########################################
## Azure OpenAI Custom Role Definitions ##
##########################################

resource "random_uuid" "openai_owner_role_id" {}
resource "random_uuid" "openai_developer_role_id" {}
resource "random_uuid" "openai_reader_role_id" {}

# OpenAI Owner (tenant-level)
resource "azurerm_role_definition" "openai_owner" {
  name               = "KopiCloud OpenAI Owner"
  role_definition_id = random_uuid.openai_owner_role_id.result
  scope              = var.management_group_id
  description        = "Azure OpenAI Owner Custom Role"

  permissions {
    actions     = local.openai_owner_actions
    not_actions = local.openai_owner_not_actions
  }

  assignable_scopes = [var.management_group_id]
}

# OpenAI Developer (tenant-level)
resource "azurerm_role_definition" "openai_developer" {
  name               = "KopiCloud OpenAI Developer"
  role_definition_id = random_uuid.openai_developer_role_id.result
  scope              = var.management_group_id
  description        = "Azure OpenAI Developer Custom Role"

  permissions {
    actions     = local.openai_developer_actions
    not_actions = local.openai_developer_not_actions
  }

  assignable_scopes = [var.management_group_id]
}

# OpenAI Reader (tenant-level)
resource "azurerm_role_definition" "openai_reader" {
  name               = "KopiCloud OpenAI Reader"
  role_definition_id = random_uuid.openai_reader_role_id.result
  scope              = var.management_group_id
  description        = "Azure OpenAI Reader Role"

  permissions {
    actions     = local.openai_reader
    not_actions = []
  }

  assignable_scopes = [var.management_group_id]
}

#######################################
## Azure OpenAI Custom Role - Output ##
#######################################

output "tenant_openai_reader_role_name" {
  value = azurerm_role_definition.openai_reader.name
}

output "tenant_openai_reader_role_id" {
  value = random_uuid.openai_reader_role_id.result
}

output "tenant_openai_developer_role_name" {
  value = azurerm_role_definition.openai_developer.name
}

output "tenant_openai_developer_role_id" {
  value = random_uuid.openai_developer_role_id.result
}

output "tenant_openai_owner_role_name" {
  value = azurerm_role_definition.openai_owner.name
}

output "tenant_openai_owner_role_id" {
  value = random_uuid.openai_owner_role_id.result
}
