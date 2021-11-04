resource "aws_route53_record" "blog" {
  zone_id = "Z08596542MGC2WLA3JHHF"
  name    = "blog.ichenterprises.net"
  type    = "A"
  ttl     = "30"
  records = ["127.0.0.1"]
}
