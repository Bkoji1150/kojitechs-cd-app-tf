# Resource: ACM Certificate
resource "aws_acm_certificate" "acm_cert" {
  domain_name       = format("*.%s", var.domain_name)
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
