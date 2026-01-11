resource "aws_route53_zone_association" "this" {
  count      = length(var.private_zone_id)
  zone_id    = var.private_zone_id[count.index]
  vpc_id     = var.vpc_id         # VPC ID in Account B
}

