resource "aws_lb_listener" "this" {
    load_balancer_arn = var.alb_arn
    protocol          = var.protocol
    port              = var.port
    certificate_arn   = var.LB_cert_arn
    ssl_policy = var.ssl_policy
    default_action {
        type             = "forward"
        target_group_arn = var.target_group_arn
    }
}







