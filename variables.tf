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
variable "key_vault_firewall_bypass_ip_cidr" {
  default     = null
  description = "(optional) describe your variable"
}
