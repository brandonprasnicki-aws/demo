locals {
  additional_common_tags = {
    prj_purpose = "Transit Gateway Attachment"
    prj_owner = "Brandon Prasnicki"
    Module = "TransitGWAttachment"

  }
  common_tags = merge(var.common_tags, local.additional_common_tags)
}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids                                      = var.tgw_attachment_subnets

  transit_gateway_id                              = var.tgw_id
  vpc_id                                          = var.vpc_id
  appliance_mode_support                          = var.appliance_mode_support

  transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation
  transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association

  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix} Attachment"
    },
  )
}


