data "aws_route53_zone" "my_domain" {
  name = "acimate.com"
  private_zone = false
}

resource "aws_route53_record" "custom_domain_record" {
  name = "api" # The subdomain (api.acimate.com)
  type = "CNAME"
  ttl = "300" # TTL in seconds

  records = ["${aws_api_gateway_rest_api.example.id}.execute-api.us-east-1.amazonaws.com"]

  zone_id = data.aws_route53_zone.my_domain.zone_id
}

resource "aws_acm_certificate" "my_api_cert" {
  domain_name = "api.acimate.com"
  #provider = aws.aws_useast1 # needs to be in US East 1 region
  #subject_alternative_names = ["api.acimate.com"] # Your custom domain
  validation_method = "DNS"
}
