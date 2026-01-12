resource "aws_lb_listener" "this" {
    load_balancer_arn = var.nlb_arn
    protocol          = var.protocol
    port              = var.port

    default_action {
        type             = "forward"
        target_group_arn = var.target_group_arn
    }
}







