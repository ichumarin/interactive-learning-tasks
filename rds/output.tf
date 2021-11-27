output "region" {
  value = var.region
}
output "subnet_list" {
  value = var.subnet_ids
}
output "DB_NAME" {
  value = aws_db_instance.mydb.name
}
output "DB_username" {
  value = aws_db_instance.mydb.username
}
output "DB_password" {
  value = aws_db_instance.mydb.password
}