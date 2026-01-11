resource "aws_lb" "nlb-external" {
  name                  = "${var.tag_prefix}-nlb-pub-${var.nlb_num}"
  internal              = false
  load_balancer_type    = "network"
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  subnets               = var.web_subnets_ids
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-nlb-web-pub"
      "Description" = "external nlb for ${local.common_tags["Project"]} instances"
    },
  )

}

