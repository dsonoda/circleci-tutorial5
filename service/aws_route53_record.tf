resource "aws_route53_record" "dsonoda" {
  zone_id = data.aws_route53_zone.dsonoda.zone_id
  name    = data.aws_route53_zone.dsonoda.name
  type    = "A"

  alias {
    name                   = aws_lb.lb.dns_name
    zone_id                = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "dsonoda_certificate" {
  zone_id = data.aws_route53_zone.dsonoda.zone_id

  allow_overwrite = true

  for_each = {
    for dvo in aws_acm_certificate.dsonoda.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
}
