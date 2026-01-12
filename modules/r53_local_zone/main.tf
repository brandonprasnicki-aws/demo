
locals {
  additional_common_tags = {
    Module = "r53_local_zone"
    ModuleOwner = "Brandon Prasnicki"
  }

  common_tags = merge(var.common_tags, local.additional_common_tags)

  #tag_prefix = var.tag_prefix

}

