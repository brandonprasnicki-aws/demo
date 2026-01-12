#variable "peer_vpc_id" {}
variable "vpc_id" {}
variable "peer_vpc_cidr" {}
#variable "peer_name" {}
variable "vpc_route_table_ids" {
  type = list(string)
}
variable "aws_vpc_peering_connection_id" {}