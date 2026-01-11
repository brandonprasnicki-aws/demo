resource "aws_subnet" "pub_subnets" {
    count          = local.has_pub_subnets != 0?length(var.availability_zones):0

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.pub_sn_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = merge(
    local.common_tags,
    {
      #"Name" = "${var.tag_prefix}_Web_Public_AZ${count.index + 1}"
      "Name" = "${var.tag_prefix}-${var.pub_subnet_purpose}-${var.availability_zones[count.index]}"
    }
  )
}

resource "aws_subnet" "pri_subnets_az1" {
  count             = length(var.pri_sn_az1_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.pri_sn_az1_cidrs[count.index]
  availability_zone = var.availability_zones[0]
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-${var.pri_subnet_purpose[count.index]}-${var.availability_zones[0]}"
    },
  )
}

resource "aws_subnet" "pri_subnets_az2" {
  count             = length(var.pri_sn_az2_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.pri_sn_az2_cidrs[count.index]
  availability_zone = var.availability_zones[1]
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-${var.pri_subnet_purpose[count.index]}-${var.availability_zones[1]}"
    },
  )
}
resource "aws_subnet" "pri_subnets_az3" {
  count             = length(var.pri_sn_az3_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.pri_sn_az3_cidrs[count.index]
  availability_zone = var.availability_zones[2]
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-${var.pri_subnet_purpose[count.index]}-${var.availability_zones[2]}"
    },
  )
}


