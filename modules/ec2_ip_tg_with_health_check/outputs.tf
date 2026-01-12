/*
output "aws_lb_target_group_alb_80_arn" {
  value = aws_lb_target_group.alb_80.arn
}
*/
output "target_group_arn" {
  value = aws_lb_target_group.this.arn
}




