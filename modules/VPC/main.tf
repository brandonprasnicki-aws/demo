locals {
  additional_common_tags = {
    Module = "vpc"
    ModuleOwner = "Brandon Prasnicki"
  }
  common_tags = merge(var.common_tags, local.additional_common_tags)
}


resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidrs[0]
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_prefix}-vpc"
    }
  )
}

resource "aws_internet_gateway" "ig" {
  count          = local.has_pub_subnets != 0?1:0
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_prefix}-igw"
    },
  )
}

resource "aws_eip" "nat_ip" {
  count = length(var.natgwy_availability_zones)
  domain = "vpc"
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_prefix}-nat-ip-az${count.index + 1}"
    },
  )
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = length(var.natgwy_availability_zones)
  allocation_id = aws_eip.nat_ip[count.index].id
  subnet_id     = aws_subnet.pub_subnets[count.index].id
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_prefix}_natgwy-az${count.index + 1}"
      "ams:rt:ams-monitoring-policy" = "ams-monitored"
    },
  )
}

