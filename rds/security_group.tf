resource "aws_security_group" "db" {
  name        = "db-sec-group"
  description = "allow trafic to DB"
  vpc_id      = "vpc-0bf4e96462538b07a"
  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
