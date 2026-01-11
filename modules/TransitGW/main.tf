locals {
  additional_common_tags = {
    Module = "TransitGW"
  }
  common_tags = merge(var.common_tags, local.additional_common_tags)
}

resource "aws_ec2_transit_gateway" "transit_gateway" {
  description                     = "Transit GW"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = merge(
    local.common_tags,
    {
      "Name" = "Transit GW"
    },
  )
}

