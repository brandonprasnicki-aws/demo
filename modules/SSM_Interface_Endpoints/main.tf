locals {
  additional_common_tags = {
    Module = "SSM_Interface_Endpoint"
    ModuleOwner = "Brandon Prasnicki"
  }
  common_tags = merge(var.common_tags, local.additional_common_tags)
}

resource "aws_vpc_endpoint" "SSM_Endpoint" {
    vpc_endpoint_type = "Interface"
    vpc_id = var.vpc_id
    service_name = "com.amazonaws.${var.region}.ssm"
    policy = "{\"Version\":\"2008-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":\"*\",\"Resource\":\"*\"}]}"
    private_dns_enabled = var.private_dns_enabled
    subnet_ids = var.connectivity_subnets
    security_group_ids = [var.security_group_id]
    tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-SSM-Interface-endpoint"
    },
  )
}

resource "aws_vpc_endpoint" "SSM_Messages_Endpoint" {
    vpc_endpoint_type = "Interface"
    vpc_id = var.vpc_id
    service_name = "com.amazonaws.${var.region}.ssmmessages"
    policy = "{\"Version\":\"2008-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":\"*\",\"Resource\":\"*\"}]}"
    private_dns_enabled = var.private_dns_enabled
    subnet_ids = var.connectivity_subnets
    security_group_ids = [var.security_group_id]
    tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-SSM-Messages-Interface-endpoint"
    },
  )
}

resource "aws_vpc_endpoint" "EC2_Messages_Endpoint" {
    vpc_endpoint_type = "Interface"
    vpc_id = var.vpc_id
    service_name = "com.amazonaws.${var.region}.ec2messages"
    policy = "{\"Version\":\"2008-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":\"*\",\"Resource\":\"*\"}]}"
    private_dns_enabled = var.private_dns_enabled
    subnet_ids = var.connectivity_subnets
    security_group_ids = [var.security_group_id]
    tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-EC2-Messages-Interface-endpoint"
    },
  )
}