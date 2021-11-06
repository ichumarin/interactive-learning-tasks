resource "aws_route53_record" "wordpress" {
  zone_id = "Z08596542MGC2WLA3JHHF"
  name    = "wordpress.ichenterprises.net"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.web.public_ip]
}