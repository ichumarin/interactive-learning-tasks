# Creater Elastic IP
resource "aws_eip" "ip1" {
  vpc  = true
  tags = local.common_tags
}
# Create NAT Gateway
resource "aws_nat_gateway" "ngw" {
  depends_on    = [aws_internet_gateway.igw, aws_eip.ip1]
  allocation_id = aws_eip.ip1.id
  subnet_id     = aws_subnet.public1.id
  tags          = local.common_tags
}