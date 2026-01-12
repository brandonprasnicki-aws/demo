variable "route_tables" {
  type        = list(string)
  description = "route tables for tgw routes"
}
variable "route_cidr" {}
variable "tgw_id" {}