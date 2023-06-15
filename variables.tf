variable "prefix" {
  type        = string
  description = "(optional) describe your variable"
}
variable "resource_group" {
  type        = string
  description = "(optional) describe your variable"
}
variable "location" {
  type        = string
  description = "(optional) describe your variable"
}
variable "tags" {
  type        = map(string)
  description = "(optional) describe your variable"
}
variable "admin_group_id" {
  type        = string
  description = "(optional) describe your variable"
}
variable "sku_name" {
  type        = string
  default     = "standard"
  description = "(optional) describe your variable"
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  default     = []
  description = "(optional) describe your variable"
}
variable "key_vault_firewall_bypass_ip_cidr" {
  type = string
  default = null
  description = "(optional) describe your variable"
}

variable "purge_protection_enabled" {
  type = bool
  default = false
  description = "(optional) describe your variable"
}
variable "soft_delete_retention_days" {
  type = number
  default = 7
  description = "(optional) describe your variable"
}

