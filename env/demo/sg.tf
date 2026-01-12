/*
module "_LBSecurityGroup" {
  source         = "../../modules/SecurityGroup"
  common_tags    = var.common_tags
  sg_description = "lb sg"
  sg_name        = "-lb-sg"
  vpc_id         = module.IngressVPC.vpc_id
}
module "_LB_Cidr_Rule_443" {
  source                = "../../modules/modules/SecurityGroupCidrRules"
  allowed_ingress_cidrs = ["0.0.0.0/0"] #var.on_prem_cidrs * will be restricted cidr var prob
  from_port             = "443"
  to_port               = "443"
  protocol              = "TCP"
  security_group_id     = module._LBSecurityGroup.security_group_id
}

module "_LB_Cidr_Rule_80" {
  source                = "../../modules/modules/SecurityGroupCidrRules"
  allowed_ingress_cidrs = ["0.0.0.0/0"] #var.on_prem_cidrs * will be restricted cidr var prob
  from_port             = "80"
  to_port               = "80"
  protocol              = "TCP"
  security_group_id     = module._LBSecurityGroup.security_group_id
}
*/
