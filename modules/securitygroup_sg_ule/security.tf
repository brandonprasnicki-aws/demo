
resource "aws_security_group_rule" "ingress_from_SG" {
  type              = "ingress"
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  description       = var.description
  #source_security_group_id    = each.value
  source_security_group_id = var.source_security_group_id
  security_group_id = var.target_security_group_id
}
