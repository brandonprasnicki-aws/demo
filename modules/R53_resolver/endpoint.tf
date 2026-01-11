resource "aws_route53_resolver_endpoint" "this" {
  name      = var.endpoint_name
  direction = var.direction

  security_group_ids = var.security_groups
  dynamic "ip_address" {
      for_each = var.subnets
      content {
        subnet_id = ip_address.value
      }
  }
  tags = merge(
    local.common_tags,
    {
      Name = var.endpoint_name
    },
  )
}