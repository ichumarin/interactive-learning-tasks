resource "aws_db_instance" "my_db" {
  security_group_names = aws_security_group.db.id
  allocated_storage    = 50
  max_allocate_storage = 500
  auto_minor_version_upgrade = true
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  
}
