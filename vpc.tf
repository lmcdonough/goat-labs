# Define the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Define the internet gateway
resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

# Define the NAT gateway
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.my_subnet.id
}

# Define the EIP
resource "aws_eip" "my_eip" {
  vpc = true
}

# Define the subnet
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}

# Define the security group
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id
}
