
resource "aws_lb_listener" "sftp_nlb_8220" {
    load_balancer_arn = aws_lb.nlb-external.arn
    protocol          = "TCP"
    port              = "8220"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.sftp-targetgroup-8220.arn
    }
}

resource "aws_lb_target_group" "sftp-targetgroup-8220" {

  name       = "${var.instance_name}-${local.common_tags["Environment"]}-nlb-tg"

  port       = "8220"
  protocol   = "TCP"
  vpc_id     = var.vpc_id

  health_check {
    #path                = var.lb_health_check_path[count.index]
    port                = "8220"
    protocol            = "TCP"
  }
  tags = merge(
    local.common_tags,
    {
      "Name" = "${var.instance_name}-${local.common_tags["Environment"]}-nlb-tg"
      "Description" = "The ${var.instance_name} service host targets for NLB"
    },
  )
}

resource "aws_alb_target_group_attachment" "tg_8220" {

  target_group_arn = aws_lb_target_group.sftp-targetgroup-8220.arn
  target_id        = var.target_id
  port             = "8220"
}






