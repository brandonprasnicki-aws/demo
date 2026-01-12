resource "aws_security_group_rule" "this" {
  type              = "ingress"
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  security_group_id = var.security_group_id
  cidr_blocks       = var.allowed_ingress_cidrs
}

