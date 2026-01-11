/*
 module "_internal_alb" {
   source      = "../../modules/EC2_alb"
   common_tags = var.common_tags
   lb_name     = "-ingress-internal-alb"
   vpc_id      = module.IngressVPC.vpc_id
   #web_cidrs = ["0.0.0.0/0"] moved sg outside this module
   subnets_ids = module.IngressVPC.pub_subnets_ids
   internal    = true
   # picking 1st in list.  Additional certs need to be added with aws_lb_listener_certificate resource/module
   # pathways
   LB_cert_arn               = "arn:aws:acm:us-east-1:271311908464:certificate/1b0409a1-0d62-42da-94de-c2f81c9ffd32"
   access_logs               = false
   access_logs_bucket        = []
   access_logs_bucket_prefix = ""
   alb_description           = "-ingress"
   alb_sg_id                 = module._LBSecurityGroup.security_group_id
 }
 module "ga_futures_cert" {
   source       = "../../modules/EC2_lb_additional_cert"
   common_tags  = var.common_tags
   listener_arn = module._internal_alb.aws_HTTPS_alb_listener_arn
   cert_arn     = "arn:aws:acm:us-east-1:271311908464:certificate/c2cf5d11-723b-4c16-9e57-2740a1838b71"
 }
 module "gsfc_cert" {
   source       = "../../modules/EC2_lb_additional_cert"
   common_tags  = var.common_tags
   listener_arn = module._internal_alb.aws_HTTPS_alb_listener_arn
   cert_arn     = "arn:aws:acm:us-east-1:271311908464:certificate/46945b76-e5d2-4e5c-8670-4605afc6bfc8"
 }

 module "Internal_alb_tg" {
   source      = "../../modules/EC2_alb_tg"
   common_tags = var.common_tags
   aws_alb_id  = module._internal_alb.aws_alb_id
   vpc_id      = module.IngressVPC.vpc_id
   tag_prefix  = ""
 }
 module "nlb-listener-80" {
   source           = "../../modules/EC2_nlb_listener"
   common_tags      = var.common_tags
   nlb_arn          = module._public_nlb.aws_nlb_arn
   port             = "80"
   protocol         = "TCP"
   target_group_arn = module.Internal_alb_tg.aws_lb_target_group_alb_80_arn
 }
 module "_public_nlb" {
   source = "../../modules/EC2_nlb"
   #alb_target_id =  module.Internal_alb.aws_alb_arn
   internal              = false
   common_tags           = merge(var.common_tags, { "ams:rt:ams-monitoring-policy" = "ams-monitored" })
   lb_name               = "-public-nlb"
   nlb_alb_listener_port = "443"
   nlb_alb_protocol      = "TCP"
   vpc_id                = module.IngressVPC.vpc_id
   subnets_ids           = module.IngressVPC.pub_subnets_ids
   target_group_arn      = module.Internal_alb_tg.aws_lb_target_group_alb_443_arn
 }

 module "demo_gsfc_nlb_TG" {
   source      = "../../modules/EC2_ip_tg"
   common_tags = var.common_tags
   target_ips  = ["10.131.2.177", "10.131.3.133"]
   tag_prefix  = "demo-"
   vpc_id      = module.IngressVPC.vpc_id
   #preserve_client_ip = false
 }



 module "demo_rule" {
   source           = "../../modules/EC2_alb_listener_rule"
   common_tags      = var.common_tags
   host_header      = "demo.gsfc.org"
   listener_arn     = module._internal_alb.aws_HTTPS_alb_listener_arn
   target_group_arn = module.demo_gsfc_nlb_TG.aws_lb_target_group_arn
 }
 module "secureqa_gafutures_org-rule" {
   source           = "../../modules/EC2_alb_listener_rule"
   common_tags      = var.common_tags
   host_header      = "secureqa.gafutures.org"
   listener_arn     = module._internal_alb.aws_HTTPS_alb_listener_arn
   target_group_arn = module.demo_gsfc_nlb_TG.aws_lb_target_group_arn
 }
 module "idpqa_gafutures_org-rule" {
   source           = "../../modules/EC2_alb_listener_rule"
   common_tags      = var.common_tags
   host_header      = "idpqa.gafutures.org"
   listener_arn     = module._internal_alb.aws_HTTPS_alb_listener_arn
   target_group_arn = module.demo_gsfc_nlb_TG.aws_lb_target_group_arn
 }

 module "qachecs_gafutures_org-rule" {
   source           = "../../modules/EC2_alb_listener_rule"
   common_tags      = var.common_tags
   host_header      = "qachecs.gafutures.org"
   listener_arn     = module._internal_alb.aws_HTTPS_alb_listener_arn
   target_group_arn = module.demo_gsfc_nlb_TG.aws_lb_target_group_arn
 }
 module "CF11qa_gafutures_org-rule" {
   source           = "../../modules/EC2_alb_listener_rule"
   common_tags      = var.common_tags
   host_header      = "cf11qa.gsfc.org"
   listener_arn     = module._internal_alb.aws_HTTPS_alb_listener_arn
   target_group_arn = module.demo_gsfc_nlb_TG.aws_lb_target_group_arn
 }
*/


