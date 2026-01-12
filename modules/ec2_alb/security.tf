/*
resource "aws_security_group" "alb_sg" {
  name        = "${var.alb_description}-ec2-alb-sg"
  description = "SG to control access to ${var.alb_description} App LB"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    local.common_tags,
    {
      Name      = "${var.alb_description}-ec2-alb-sg"
      Description = "SG to control access to ${var.alb_description} App LB"

    },
  )
}
resource "aws_security_group_rule" "alb_sg_http" {
  count = var.enable_http?1:0

  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.web_cidrs
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "alb_sg_https" {
  count = var.enable_https?1:0
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.web_cidrs
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "alb_sg_egress" {
  type              = "egress"
  from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
}

 */

