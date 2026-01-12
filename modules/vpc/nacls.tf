/*
resource "aws_network_acl" "internal" {
  vpc_id     = var.vpc_id
  subnet_ids = concat(aws_subnet.app_subnets.*.id)

  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-vpc-pri-nacl"
    },
  )
}


resource "aws_network_acl_rule" "internal_e1" {
  network_acl_id = aws_network_acl.internal.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

#Internal CIDRS

resource "aws_network_acl_rule" "internal_i1" {
  count = length(var.vpc_cidrs)

  network_acl_id = aws_network_acl.internal.id
  rule_number    = "200"
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block = var.vpc_cidrs[count.index]
  #cidr_block = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

# for troubleshooting attempt for ssm
#resource "aws_network_acl_rule" "internal_i2" {
#  network_acl_id = aws_network_acl.internal.id
#  rule_number    = "201"
#  egress         = false
#  protocol       = "-1"
#  rule_action    = "allow"
#  cidr_block = "0.0.0.0/0"
#  from_port      = 0
#  to_port        = 0
#}
#ephymeral ports for ssm
resource "aws_network_acl_rule" "internal_i3" {
  network_acl_id = aws_network_acl.internal.id
  rule_number    = "300"
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block = "0.0.0.0/0"
  from_port      = 32768
  to_port        = 65535
}

resource "aws_network_acl_rule" "internal_i5" {
  network_acl_id = aws_network_acl.internal.id
  rule_number    = "401"
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block = var.rh_vpn_cidrs[1]
  #cidr_block = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}
resource "aws_network_acl" "external" {
  vpc_id     = var.vpc_id
  subnet_ids = aws_subnet.web_subnets.*.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-vpc-pub-nacl"
    },
  )
}

resource "aws_network_acl_rule" "external_e1" {
  network_acl_id = aws_network_acl.external.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}
#Internal Web Traffic
resource "aws_network_acl_rule" "external_i1" {
  count = length(var.vpc_cidrs)

  network_acl_id = aws_network_acl.external.id
  rule_number    = "101"
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block = var.vpc_cidrs[count.index]
  from_port      = 0
  to_port        = 0
}

  #Ephemeral Ports
  resource "aws_network_acl_rule" "external_i2" {
  network_acl_id = aws_network_acl.external.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

#http Ports
resource "aws_network_acl_rule" "external_i3" {
  count = var.allow_public_http ? 1 : 0

  network_acl_id = aws_network_acl.external.id
  rule_number    = 300
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "external_i4" {
  count = var.allow_public_https ? 1 : 0

  network_acl_id = aws_network_acl.external.id
  rule_number    = 301
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}
resource "aws_network_acl_rule" "external_i5" {
  network_acl_id = aws_network_acl.external.id
  rule_number    = 302
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}
resource "aws_network_acl_rule" "internal_i6" {
  network_acl_id = aws_network_acl.external.id
  rule_number    = "400"
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block = var.rh_vpn_cidrs[0]
  #cidr_block = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}
resource "aws_network_acl_rule" "internal_i7" {
  network_acl_id = aws_network_acl.external.id
  rule_number    = "401"
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block = var.rh_vpn_cidrs[1]
  #cidr_block = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}




  
*/