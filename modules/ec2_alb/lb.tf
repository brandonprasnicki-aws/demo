
resource "aws_alb" "this" {
  name = var.lb_name
  #subnets         = module.VPC.app_subnets_ids
  subnets = var.subnets_ids
  internal = var.internal
  security_groups = [var.alb_sg_id]
  enable_http2    = true
  idle_timeout    = 600
  drop_invalid_header_fields = var.drop_invalid_header_fields
  enable_deletion_protection = var.enable_deletion_protection
  dynamic "access_logs" {
    for_each = var.access_logs_bucket
    content {
      enabled = var.access_logs
      bucket  = var.access_logs_bucket[0]
      prefix  = var.access_logs_bucket_prefix
    }
  }


  tags = merge(
    local.common_tags,
    {
      "Name" = var.lb_name
      "Description" = "alb for ${var.alb_description} instances"
    },
  )
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_alb_listener" "HTTP" {

  load_balancer_arn = aws_alb.this.arn
  port              = "80"
  protocol          = "HTTP"

 default_action {
    type = "redirect"

   redirect {
         host        = "#{host}"
         path        = "/#{path}"
         port        = "443"
         protocol    = "HTTPS"
         query       = "#{query}"
         status_code = "HTTP_301"
    }
 }
}

resource "aws_alb_listener" "HTTPS" {

  load_balancer_arn = aws_alb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.LB_cert_arn
  ssl_policy = var.ssl_policy

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hello World ${local.common_tags["Project"]}"
      status_code  = "200"
    }
  }
}



/*
resource "aws_lb_cookie_stickiness_policy" "foo" {
  name                     = "foo-policy"
  load_balancer            = aws_elb.lb.id
  lb_port                  = 80
  cookie_expiration_period = 600
}
*/