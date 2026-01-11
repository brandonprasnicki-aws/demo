
resource "aws_route_table" "public_route_table" {
  count          = local.has_pub_subnets != 0?1:0
  vpc_id = var.vpc_id

  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-public"
    },
  )
}

resource "aws_route" "ig_route" {
  count          = local.has_pub_subnets != 0?1:0
  route_table_id = aws_route_table.public_route_table[count.index].id

  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.ig[0].id
}


resource "aws_route_table_association" "rta-public" {
  count          = local.has_pub_subnets != 0?length(var.availability_zones):0

  subnet_id      = aws_subnet.pub_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table[0].id
}

resource "aws_route_table" "private_route_table" {
  vpc_id           = var.vpc_id

  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-private-rt"
    },
  )
}

resource "aws_route" "nat_route_az1" {
  count            = var.az1_rt_natgwy_index_tgt != null?length(var.pri_sn_az1_cidrs):0
  route_table_id = aws_route_table.private_route_table.id

  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gateway[var.az1_rt_natgwy_index_tgt].id
}
/*
#if using more than 1 general rt (per az)
resource "aws_route" "nat_route_az2" {
  count            = var.az2_rt_natgwy_index_tgt != null?length(var.pri_sn_az2_cidrs):0
  route_table_id = aws_route_table.private_route_table_az2[count.index].id

  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gateway[var.az2_rt_natgwy_index_tgt].id
}
resource "aws_route" "nat_route_az3" {
  count            = var.az3_rt_natgwy_index_tgt != null?length(var.pri_sn_az2_cidrs):0
  route_table_id = aws_route_table.private_route_table_az3[count.index].id

  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gateway[var.az3_rt_natgwy_index_tgt].id
}

resource "aws_route_table_association" "rta-pri_subnets_az1" {
  count          = length(var.pri_sn_az1_cidrs)

  subnet_id      = aws_subnet.pri_subnets_az1[count.index].id
  route_table_id = var.pri_az1_route_table_id
  #if using rt per az
  #route_table_id = aws_route_table.private_route_table_az1[count.index].id
}

resource "aws_route_table_association" "rta-pri_subnets_az2" {
  count          = length(var.pri_sn_az2_cidrs)

  subnet_id      = aws_subnet.pri_subnets_az2[count.index].id
  route_table_id = var.pri_az2_route_table_id
}

resource "aws_route_table_association" "rta-pri_subnets_az3" {
  count          = length(var.pri_sn_az3_cidrs)

  subnet_id      = aws_subnet.pri_subnets_az3[count.index].id
  route_table_id = var.pri_az3_route_table_id
}
*/
