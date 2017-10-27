resource "aws_route53_record" "prod-app-url" {
  zone_id = "Z27HN95YLRNUWB"
  name    = "bookshelf.ng"
  type    = "A"
  ttl     = "300"
  records = ["52.19.0.218"]
}

resource "aws_route53_record" "prod-website-a" {
  zone_id = "Z27HN95YLRNUWB"
  name    = "www.peculiarppv.com"
  type    = "A"
  ttl     = "300"
  records = ["52.19.0.218"]
}

resource "aws_route53_record" "prod-website-b" {
  zone_id = "Z27HN95YLRNUWB"
  name    = "peculiarppv.com"
  type    = "A"
  ttl     = "300"
  records = ["52.19.0.218"]
}
