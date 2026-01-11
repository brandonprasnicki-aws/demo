
resource "aws_lb_listener" "nlb_443" {
    load_balancer_arn = aws_lb.nlb-external.arn
    protocol          = "TCP"
    port              = "443"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.alb_443.arn
    }
}
resource "aws_lb_target_group" "alb_443" {

  name       = "${local.common_tags["Environment"]}-alb-tg-443-nlb-${var.nlb_num}"

  port       = "443"
  protocol   = "TCP"
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
      "Name" = "${local.common_tags["Environment"]}-alb-tg-443-nlb-${var.nlb_num}"
      "Description" = "The alb target for 443"
    },
  )
}

resource "aws_alb_target_group_attachment" "tg_443" {

  target_group_arn = aws_lb_target_group.alb_443.arn
  target_id        = var.alb_target_id
  port             = "443"
}
resource "aws_lb_listener" "nlb_80" {
    load_balancer_arn = aws_lb.nlb-external.arn
    protocol          = "TCP"
    port              = "80"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.alb_80.arn
    }
}

resource "aws_lb_target_group" "alb_80" {

  name       = "${local.common_tags["Environment"]}-alb-tg-80-nlb-${var.nlb_num}"

  port       = "80"
  protocol   = "TCP"
  vpc_id     = var.vpc_id
  target_type = "alb"

  health_check {
    #path                = var.lb_health_check_path[count.index]
    port                = "80"
    protocol            = "HTTP"
  }
  tags = merge(
    local.common_tags,
    {
      "Name" = "${local.common_tags["Environment"]}-alb-tg-80-nlb-${var.nlb_num}"
      "Description" = "The alb target for 80"
    },
  )
}


resource "aws_alb_target_group_attachment" "tg_80" {

  target_group_arn = aws_lb_target_group.alb_80.arn
  target_id        = var.alb_target_id
  port             = "80"
}













