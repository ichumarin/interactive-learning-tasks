output "sec_group_id" {
  value = aws_security_group.external_by_terraform.id
}
data "aws_caller_identity" "current" {}
output "owner_id" {
  value = data.aws_caller_identity.current.account_id
}
output "arn" {
  value = aws_security_group.external_by_terraform.arn
}
