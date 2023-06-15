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
variable "admin_group_id" {
  type = string
  description = "(optional) describe your variable"
}