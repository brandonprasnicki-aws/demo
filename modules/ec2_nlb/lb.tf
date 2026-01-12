resource "aws_lb" "this" {
  name                  = var.lb_name
  internal              = var.internal
  load_balancer_type    = "network"
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  subnets               = var.subnets_ids
  enable_deletion_protection = var.enable_deletion_protection
  tags = merge(
    local.common_tags,
    {
      "Name" = var.lb_name
      "Description" = "nlb for ${local.common_tags["Project"]} instances"
    },
  )

}

