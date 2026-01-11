resource "aws_route" "private_route" {
  count            = length(var.route_tables)
  route_table_id   = var.route_tables[count.index]

  destination_cidr_block    = var.route_cidr
  transit_gateway_id = var.tgw_id
}