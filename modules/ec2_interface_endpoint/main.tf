locals {
  additional_common_tags = {
    Module = "S3_Interface_Endpoint"
    ModuleOwner = "Brandon Prasnicki"
  }
  common_tags = merge(var.common_tags, local.additional_common_tags)
}

resource "aws_vpc_endpoint" "EC2_Interface_Endpoint" {
    vpc_endpoint_type = "Interface"
    vpc_id = var.vpc_id
    service_name = "com.amazonaws.${var.region}.ec2"
    policy = "{\"Version\":\"2008-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":\"*\",\"Resource\":\"*\"}]}"
    private_dns_enabled = true
    subnet_ids = var.mgn_subnets
    security_group_ids = [var.security_group_id]
    tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-ec2-Interface-endpoint"
    },
  )
}