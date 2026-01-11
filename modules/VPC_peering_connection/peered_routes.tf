resource "aws_route" "peering_connection_route_vpc_to_peervpc" {
  count            = length(var.vpc_route_table_ids)
  route_table_id   = var.vpc_route_table_ids[count.index]

  destination_cidr_block    = var.peer_vpc_cidr
  vpc_peering_connection_id = var.aws_vpc_peering_connection_id
}