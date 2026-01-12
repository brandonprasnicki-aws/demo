data "aws_caller_identity" "current" {
}


locals {
  additional_common_tags = {
    Module = "ec2_alb"
    ModuleOwner = "Brandon Prasnicki"
  }

  common_tags = merge(var.common_tags, local.additional_common_tags)

  #tag_prefix = var.tag_prefix

}

