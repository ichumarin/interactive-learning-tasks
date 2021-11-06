output "az" {
  value = aws_instance.web.availability_zone
}
output "public_ip" {
  value = aws_instance.web.public_ip
}
output "instance_id" {
  value = aws_instance.web.id
}
data "aws_region" "current" {}
output "region" {
  value = data.aws_region.current.name
}