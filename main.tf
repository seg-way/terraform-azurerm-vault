data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "des_vault" {
  location                    = var.location
  name                        = var.prefix
  resource_group_name         = var.resource_group
  sku_name                    = var.sku_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  enable_rbac_authorization   = false

  purge_protection_enabled   = true
  soft_delete_retention_days = 7

  tags = var.tags
}


resource "azurerm_key_vault_access_policy" "admins" {
  key_vault_id = azurerm_key_vault.des_vault.id
  object_id    = var.admin_group_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  key_permissions = [
    "Get",
    "Create",
    "Delete", "Recover", "Release",
    "List"
  ]
}
