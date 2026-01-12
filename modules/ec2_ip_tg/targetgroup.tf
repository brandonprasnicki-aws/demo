
resource "aws_lb_target_group" "this" {

  name       = "${var.tag_prefix}-ip-tg-443-alb"

  protocol          = "HTTPS"
  port              = "443"
  vpc_id     = var.vpc_id
  target_type = "ip"

#  health_check {
#    #path                = var.lb_health_check_path[count.index]
#    port                = "443"
#    protocol            = "HTTPS"
#  }
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-ip-tg-443-alb"
      "Description" = "The workload nlb ip target for 443"
    },
  )
}

resource "aws_alb_target_group_attachment" "this" {
  count = length(var.target_ips)
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.target_ips[count.index]
  availability_zone = var.availability_zone
  port             = "443"
}

/*
resource "aws_lb_target_group" "alb_80" {
  name       = "${local.common_tags["Project"]}-alb-tg-80-nlb"

  protocol          = "TCP"
  port              = "80"
  vpc_id     = var.vpc_id
  target_type = "alb"

#  health_check {
#    #path                = var.lb_health_check_path[count.index]
#    port                = "443"
#    protocol            = "HTTPS"
#  }
  tags = merge(
    local.common_tags,
    {
      "Name" = "${local.common_tags["Project"]}-alb-tg-443-nlb"
      "Description" = "The alb target for 443"
    },
  )
}

resource "aws_alb_target_group_attachment" "alb_attach_80" {
  target_group_arn = aws_lb_target_group.alb_80.arn
  target_id        = var.aws_alb_id
  port             = "80"
}
*/
