data "azurerm_client_config" "current" {}


data "curl" "public_ip" {
  count = var.key_vault_firewall_bypass_ip_cidr == null ? 1 : 0

  http_method = "GET"
  uri         = "https://api.ipify.org?format=json"
}

locals {
  # We cannot use coalesce here because it's not short-circuit and public_ip's index will cause error
  public_ip = var.key_vault_firewall_bypass_ip_cidr == null ? jsondecode(data.curl.public_ip[0].response).ip : var.key_vault_firewall_bypass_ip_cidr
}

resource "azurerm_key_vault" "des_vault" {
  location                    = var.location
  name                        = var.prefix
  resource_group_name         = var.resource_group
  sku_name                    = var.sku_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  enable_rbac_authorization   = true

  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
    ip_rules                   = [local.public_ip]
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "role_assignment" {
  scope                = azurerm_key_vault.des_vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = var.admin_group_id
}


resource "azurerm_role_definition" "privelinkadmin" {
  name        = "Key Vault Private Link Administrator"
  scope       = azurerm_key_vault.des_vault.id
  description = "Approve private links"

  permissions {
    actions = [
      "PrivateEndpointConnectionsApproval/action"
    ]
  }

}

# resource "azurerm_key_vault_access_policy" "admins" {
#   key_vault_id = azurerm_key_vault.des_vault.id
#   object_id    = var.admin_group_id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   key_permissions = [
#     "Get",
#     "GetRotationPolicy",
#     "Create",
#     "Delete",
#     "Recover",
#     "Release",
#     "SetRotationPolicy",
#     "List"
#   ]
# }
