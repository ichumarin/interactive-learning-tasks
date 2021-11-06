locals {
  common_tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }
}
# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags       = local.common_tags
}
# Create public sunets
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true
  cidr_block              = "10.0.1.0/24"
  tags                    = local.common_tags
}
resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = true
  cidr_block              = "10.0.2.0/24"
  tags                    = local.common_tags
}
resource "aws_subnet" "public3" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = true
  cidr_block              = "10.0.3.0/24"
  tags                    = local.common_tags
}
# Create private subnets
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "eu-west-1a"
  cidr_block        = "10.0.101.0/24"
  tags              = local.common_tags
}
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "eu-west-1b"
  cidr_block        = "10.0.102.0/24"
  tags              = local.common_tags
}
resource "aws_subnet" "private3" {
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "eu-west-1c"
  cidr_block        = "10.0.103.0/24"
  tags              = local.common_tags
}

# Create IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags   = local.common_tags
}

# Create NAT Gateway
resource "aws_eip" "byoip-ip" {
  vpc              = true
  public_ipv4_pool = "ipv4pool-ec2-012345"
  depends_on       = [aws_internet_gateway.igw]
  tags             = local.common_tags
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.byoip-ip.id
  subnet_id     = aws_subnet.public1.id

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
  tags       = local.common_tags
}

# Public route tables 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  
  route = [
    {
      cidr_block = "10.0.1.0/24"
      gateway_id = aws_internet_gateway.igw.id
    }


# Private route tables 