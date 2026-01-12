/*
locals {
    is_az3 = length(var.pri_sn_az3_cidrs)
}
resource "aws_vpc_endpoint" "EC2VPCEndpoint" {
    vpc_endpoint_type = "Gateway"
    vpc_id = var.vpc_id
    service_name = "com.amazonaws.${var.region}.s3"
    policy = "{\"Version\":\"2008-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":\"*\",\"Resource\":\"*\"}]}"
    route_table_ids = var.s3_endpoint_route_tables
    private_dns_enabled = false
    tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-endpoint"
    },
  )
}
*/