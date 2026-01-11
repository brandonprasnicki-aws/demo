resource "aws_route53_resolver_rule" "this" {
  domain_name          = var.domain
  name                 = var.rule_name
  rule_type            = var.rule_type
  resolver_endpoint_id = var.endpoint_id
  dynamic "target_ip" {
      for_each = var.ad_ips
      content {
        ip = target_ip.value
      }
  }

  tags = merge(
    local.common_tags,
    {
      Name = var.rule_name
    },
  )
}

resource "aws_route53_resolver_rule_association" "this" {
  resolver_rule_id = aws_route53_resolver_rule.this.id
  vpc_id           = var.vpc_id
}
