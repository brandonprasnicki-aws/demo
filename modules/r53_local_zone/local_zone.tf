resource "aws_route53_zone" "this" {
  name = var.zone_name

  vpc {
    vpc_id = var.vpc_id
  }
  lifecycle {
    ignore_changes = [
      vpc, # Ignore changes to the entire 'vpc' block - this is for when the zone is shared
    ]
  }
}

resource "aws_route53_record" "this" {
  for_each = var.record
#  count = length(var.record)
  zone_id = aws_route53_zone.this.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record_name]
  ttl     = each.value.ttl
/* for alias which should be a separate variable and resource when needed var.alias_record (alias_record_target_name etc in the map)
  alias {
    name                   = each.value.record_target_name
    zone_id                = each.value.record_target_zone
    evaluate_target_health = true
  }

 */
}