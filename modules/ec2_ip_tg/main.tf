locals {
  additional_common_tags = {
    Module = "ec2_ip_tg"
    ModuleOwner = "Brandon Prasnicki"
  }

  common_tags = merge(var.common_tags, local.additional_common_tags)

  #tag_prefix = var.tag_prefix

}

