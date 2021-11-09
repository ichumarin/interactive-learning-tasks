# Create public sunets
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = data.aws_availability_zones.all.names[0]
  map_public_ip_on_launch = true
  cidr_block              = "10.0.101.0/24"
  tags                    = local.common_tags
}
resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = data.aws_availability_zones.all.names[1]
  map_public_ip_on_launch = true
  cidr_block              = "10.0.102.0/24"
  tags                    = local.common_tags
}
resource "aws_subnet" "public3" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = data.aws_availability_zones.all.names[2]
  map_public_ip_on_launch = true
  cidr_block              = "10.0.103.0/24"
  tags                    = local.common_tags
}

# Public route subnet association 
resource "aws_route_table_association" "public1_rt" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2_rt" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public3_rt" {
  subnet_id      = aws_subnet.public3.id
  route_table_id = aws_route_table.public.id
}