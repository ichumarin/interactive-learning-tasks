# Create IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = local.common_tags
}