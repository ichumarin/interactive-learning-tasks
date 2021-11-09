# Create private subnets
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.all.names[0]
  cidr_block        = "10.0.1.0/24"
  tags              = local.common_tags
}
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.all.names[1]
  cidr_block        = "10.0.2.0/24"
  tags              = local.common_tags
}
resource "aws_subnet" "private3" {
  vpc_id            = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.all.names[2]
  cidr_block        = "10.0.3.0/24"
  tags              = local.common_tags
}

# Private route subnet associationns
resource "aws_route_table_association" "private1_rt" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2_rt" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private3_rt" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.private.id
}