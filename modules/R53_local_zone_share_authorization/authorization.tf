resource "aws_route53_vpc_association_authorization" "this" {
  count            = length(var.vpc_id)
  zone_id    = var.private_zone_id
  vpc_id     = var.vpc_id[count.index]              # VPC ID in Account B
  vpc_region = var.region            # Region of VPC in Account B
}
