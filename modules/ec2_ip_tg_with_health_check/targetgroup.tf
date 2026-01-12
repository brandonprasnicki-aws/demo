
resource "aws_lb_target_group" "this" {

  name       = "${var.tg_name}-${var.tg_port}-tg"

  protocol          = var.tg_protocol
  port              = var.tg_port
  vpc_id     = var.vpc_id
  target_type = "ip"

  health_check {
    #path                = var.lb_health_check_path[count.index]
    path                = var.lb_health_check_path
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    interval            = var.interval
    matcher             = var.matcher
    protocol            = var.tg_protocol
  }
  stickiness {
    type = var.stickiness_type
  }
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tg_name}-${var.tg_port}-tg"
      "Description" = "The ip target for ${var.tg_port}"
    },
  )
}

resource "aws_alb_target_group_attachment" "this" {
  count = length(var.target_ips)
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.target_ips[count.index]
  availability_zone = var.availability_zone[count.index]
  port             = var.tg_port
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
