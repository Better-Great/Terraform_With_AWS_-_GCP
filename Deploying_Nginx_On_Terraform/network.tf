# Create a VPC for Nginx Server
resource "aws_vpc" "Nginx-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Nginx-vpc"
  }
}

# Create The Private Subnets for Nginx Server
resource "aws_subnet" "nginx_private_subnet_1" {
  vpc_id            = aws_vpc.Nginx-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a" 
  map_public_ip_on_launch = false
  tags = {
    Name = "Nginx-Private-Subnet-1"
  }
}

resource "aws_subnet" "nginx_private_subnet_2" {
  vpc_id            = aws_vpc.Nginx-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = false
  tags = {
    Name = "Nginx-Private-Subnet-2"
  }
}

# Create an Internet Gateway To Access the Internet
resource "aws_internet_gateway" "Nginx-igw" {
  vpc_id = aws_vpc.Nginx-vpc.id
  tags = {
    Name = "Nginx-igw"
  }
}

# Create A route table for the internet gateway
resource "aws_route_table" "Nginx-public-route-table" {
  vpc_id = aws_vpc.Nginx-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Nginx-igw.id
  }
  tags = {
    Name = "Nginx-public-route-table"
  }
}

# Associate the private subnets with the route table
resource "aws_route_table_association" "private_subnet_associate_1" {
  subnet_id      = aws_subnet.nginx_private_subnet_1.id
  route_table_id = aws_route_table.Nginx-public-route-table.id
}

resource "aws_route_table_association" "private_subnet_associate_2" {
  subnet_id      = aws_subnet.nginx_private_subnet_2.id
  route_table_id = aws_route_table.Nginx-public-route-table.id
}