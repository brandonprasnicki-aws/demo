
output "aws_nlb_arn" {
  value = aws_lb.this.arn
}
output "aws_nlb_id" {
  value = aws_lb.this.id
}
output "aws_lb_dns_name" {
  value = aws_lb.this.dns_name
}
output "aws_lb_zone_id" {
  value = aws_lb.this.zone_id
}

