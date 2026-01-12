
resource "aws_lb_listener" "nlb_443" {
    load_balancer_arn = aws_lb.this.arn
    protocol          = var.protocol
    port              = var.nlb_alb_listener_port

    default_action {
        type             = "forward"
       target_group_arn = var.target_group_arn
    }

}
/*
resource "aws_lb_listener" "nlb_80" {
    load_balancer_arn = aws_lb.this.arn
    protocol          = var.protocol
    port              = var.nlb_alb_listener_port

    default_action {
        type             = "forward"
       target_group_arn = var.alb_arn
    }

}
*/



