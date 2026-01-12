
resource "aws_lb_target_group" "alb_443" {

  name       = "${var.tag_prefix}-alb-tg-443-nlb"

  protocol          = "TCP"
  port              = "443"
  vpc_id     = var.vpc_id
  target_type = "alb"

  health_check {
    path                 = "/"
    port                = "443"
    protocol            = "HTTPS"
  }
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-alb-tg-443-nlb"
      "Description" = "The alb target for 443"
    },
  )
}

resource "aws_alb_target_group_attachment" "alb_attach_443" {

  target_group_arn = aws_lb_target_group.alb_443.arn
  target_id        = var.aws_alb_id
  port             = "443"
}


resource "aws_lb_target_group" "alb_80" {
  name       = "${var.tag_prefix}-alb-tg-80-nlb"

  protocol          = "TCP"
  port              = "80"
  vpc_id     = var.vpc_id
  target_type = "alb"

  health_check {
    path                 = "/"
    port                = "80"
    protocol            = "HTTP"
  }
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.tag_prefix}-alb-tg-80-nlb"
      "Description" = "The alb target for 80"
    },
  )
}

resource "aws_alb_target_group_attachment" "alb_attach_80" {
  target_group_arn = aws_lb_target_group.alb_80.arn
  target_id        = var.aws_alb_id
  port             = "80"
}

