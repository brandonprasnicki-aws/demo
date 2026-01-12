locals {
  additional_common_tags = {
    Module = "vpc_dhcp_options"
    ModuleOwner = "Brandon Prasnicki"
  }
  common_tags = merge(var.common_tags, local.additional_common_tags)
}
