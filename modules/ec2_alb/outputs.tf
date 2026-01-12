output "aws_alb_arn" {
  value = aws_alb.this.arn
}
output "aws_alb_id" {
  value = aws_alb.this.id
}
/*
output "alb_security_group" {
  value = aws_security_group.alb_sg.id
}

 */

output "aws_HTTP_alb_listener_arn" {
  value = aws_alb_listener.HTTP.arn
}

output "aws_HTTPS_alb_listener_arn" {
  value = aws_alb_listener.HTTPS.arn
}
output "aws_lb_dns_name" {
  value = aws_alb.this.dns_name
}
output "aws_lb_zone_id" {
  value = aws_alb.this.zone_id
}



