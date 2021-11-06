output "key_name" {
  description = "key-name"
  value       = aws_key_pair.ilearning-wordpress.key_name
}

output "key_id" {
  description = "keypair_id"
  value       = aws_key_pair.ilearning-wordpress.key_pair_id
}

data "aws_region" "current" {}
output "region" {
  value = data.aws_region.current.name
}