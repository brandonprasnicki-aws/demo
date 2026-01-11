locals {
  additional_common_tags = {
    prj_purpose = "Transit Gateway Attachment"
    prj_owner = "Brandon Prasnicki"
    Module = "TransitGWRouteTable"

  }
  common_tags = merge(var.common_tags, local.additional_common_tags)
}


resource "aws_ec2_transit_gateway_route_table" "this" {
  transit_gateway_id = var.tgw_id
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-rt"
    },
  )
}

resource "aws_ec2_transit_gateway_route_table_association" "this" {
  count = length(var.source_tgw_attachment)
  transit_gateway_attachment_id  = var.source_tgw_attachment[count.index]
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}


resource "aws_ec2_transit_gateway_route" "TGW_route" {
  count = length(var.tgw_rt_cidrs)
  destination_cidr_block         = var.tgw_rt_cidrs[count.index]


  transit_gateway_attachment_id  = var.routed_transit_gateway_attachment_id[count.index]
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}


