resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "this" {
  transit_gateway_attachment_id = var.tgw_attachment_id
  transit_gateway_default_route_table_propagation = false
  transit_gateway_default_route_table_association = false
  tags = {
    Name = "${var.tag_prefix} cross-account attachment"
  }
}