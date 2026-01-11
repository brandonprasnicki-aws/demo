resource "aws_alb_target_group" "this" {

  name       = "${var.tg_name}-${var.tg_port}-tg"

  port       = var.tg_port
  protocol   = var.tg_protocol
  vpc_id     = var.vpc_id

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
      "Description" = "The ${var.tg_name} service host targets for LB"
    },
  )
}

resource "aws_alb_target_group_attachment" "this" {
  count = length(var.target_ids)
  target_group_arn = aws_alb_target_group.this.arn
  target_id        = var.target_ids[count.index]
  port             = var.tg_port
}







